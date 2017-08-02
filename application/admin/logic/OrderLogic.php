<?php

/**
 * tpshop
 * ============================================================================
 * 版权所有 2015-2027 深圳搜豹网络科技有限公司，并保留所有权利。
 * 网站地址: http://www.tp-shop.cn
 * ----------------------------------------------------------------------------
 * 这不是一个自由软件！您只能在不用于商业目的的前提下对程序代码进行修改和使用 .
 * 不允许对程序代码以任何形式任何目的的再发布。
 * ============================================================================
 * Date: 2015-09-14
 */


namespace app\admin\logic;

use think\Model;
use think\Db;
class OrderLogic extends Model
{
    /**
     * @param array $condition  搜索条件
     * @param string $order   排序方式
     * @param int $start    limit开始行
     * @param int $page_size  获取数量
     */
    public function getOrderList($condition,$order='',$start=0,$page_size=20){
        $res = M('order')->where($condition)->limit("$start,$page_size")->order($order)->select();
        return $res;
    }

    /**
     * 获取订单商品详情  2017-4-28 lxl 改
     * @param $order_id
     * @param string $is_send
     * @return mixed
     */
    public function getOrderGoods($order_id,$is_send =''){
        if($is_send){
            $where=" and o.is_send < $is_send";
        }
        $sql = "SELECT g.*,o.*,(o.goods_num * o.member_goods_price) AS goods_total FROM __PREFIX__order_goods o ".
            "LEFT JOIN __PREFIX__goods g ON o.goods_id = g.goods_id WHERE o.order_id = $order_id ".$where;
        $res = DB::query($sql);
        return $res;
    }


    /*
     * 获取订单信息
     */
    public function getOrderInfo($order_id)
    {
        //  订单总金额查询语句
        $order = M('order')->where("order_id = $order_id")->find();
        return $order;
    }



    /*
     * 订单操作记录
     */
    public function orderActionLog($order_id,$action,$note=''){    	
        $order = M('order')->where(array('order_id'=>$order_id))->find();
        $data['order_id'] = $order_id;
        $data['action_user'] = session('admin_id');
        $data['action_note'] = $note;
        $data['order_status'] = $order['order_status'];
        $data['pay_status'] = $order['pay_status'];
        $data['shipping_status'] = $order['shipping_status'];
        $data['log_time'] = time();
        $data['status_desc'] = $action;        
        return M('order_action')->add($data);//订单操作记录
    }
    
    public function orderProcessHandle($order_id,$act,$ext=array()){
    	$updata = array();
    	switch ($act){
    		case 'pay': //付款
               	$order_sn = M('order')->where("order_id = $order_id")->getField("order_sn");
                update_pay_status($order_sn,$ext); // 调用确认收货按钮
    			return true;    			
    		case 'pay_cancel': //取消付款
    			$updata['pay_status'] = 0;
    			$this->order_pay_cancel($order_id);
    			return true;
    		case 'confirm': //确认订单
    			$updata['order_status'] = 1;
    			break;
    		case 'cancel': //取消确认
    			$updata['order_status'] = 0;
    			break;
    		case 'invalid': //作废订单
    			$updata['order_status'] = 5;
    			break;
    		case 'remove': //移除订单
    			$this->delOrder($order_id);
    			break;
    		case 'delivery_confirm'://确认收货
    			confirm_order($order_id); // 调用确认收货按钮
    			return true;
    		default:
    			return true;
    	}
    	return M('order')->where("order_id=$order_id")->save($updata);//改变订单状态
    }
    
    
    //管理员取消付款
    function order_pay_cancel($order_id)
    {
    	//如果这笔订单已经取消付款过了
    	$count = M('order')->where("order_id = $order_id and pay_status = 1")->count();   // 看看有没已经处理过这笔订单  支付宝返回不重复处理操作
    	if($count == 0) return false;
    	// 找出对应的订单
    	$order = M('order')->where("order_id = $order_id")->find();
    	// 增加对应商品的库存
        $orderGoodsArr = M('OrderGoods')->where("order_id = $order_id")->select();
    	foreach($orderGoodsArr as $key => $val)
    	{
    		if(!empty($val['spec_key']))// 有选择规格的商品
    		{   // 先到规格表里面增加数量 再重新刷新一个 这件商品的总数量
    			M('SpecGoodsPrice')->where("goods_id = {$val['goods_id']} and `key` = '{$val['spec_key']}'")->setInc('store_count',$val['goods_num']);
    			refresh_stock($val['goods_id']);
    		}else{
    			M('Goods')->where("goods_id = {$val['goods_id']}")->setInc('store_count',$val['goods_num']); // 增加商品总数量
    		}
    		M('Goods')->where("goods_id = {$val['goods_id']}")->setDec('sales_sum',$val['goods_num']); // 减少商品销售量
    		//更新活动商品购买量
    		if($val['prom_type']==1 || $val['prom_type']==2){
    			$prom = get_goods_promotion($val['goods_id']);
    			if($prom['is_end']==0){
    				$tb = $val['prom_type']==1 ? 'flash_sale' : 'group_buy';
    				M($tb)->where("id=".$val['prom_id'])->setDec('buy_num',$val['goods_num']);
    				M($tb)->where("id=".$val['prom_id'])->setDec('order_num');
    			}
    		}
    	}
    	// 根据order表查看消费记录 给他会员等级升级 修改他的折扣 和 总金额
    	M('order')->where("order_id=$order_id")->save(array('pay_status'=>0));
    	update_user_level($order['user_id']);
    	// 记录订单操作日志
    	logOrder($order['order_id'],'订单取消付款','付款取消',$order['user_id']);
    	//分销设置
    	M('rebate_log')->where("order_id = {$order['order_id']}")->save(array('status'=>0));
    }
    


    /**
     * 删除订单
     */
    function delOrder($order_id){
    	$a = M('order')->where(array('order_id'=>$order_id))->delete();
    	$b = M('order_goods')->where(array('order_id'=>$order_id))->delete();
    	return $a && $b;
    }

	/**
	 * 当订单里商品都退货完成，将订单状态改成关闭
	 * @param $order_id
	 */
	function closeOrderByReturn($order_id)
	{
		$order_goods_list = Db::name('order_goods')->where(['order_id' => $order_id])->select();
		$order_goods_count = count($order_goods_list);
		$order_goods_return_count = 0;//退货个数
		for ($i = 0; $i < $order_goods_count; $i++) {
			if ($order_goods_list[$i]['is_send'] == 3) {
				$order_goods_return_count++;
			}
		}
		if ($order_goods_count == $order_goods_return_count) {
			Db::name('order')->where(['order_id' => $order_id])->update(['order_status' => 5]);
		}
	}


}