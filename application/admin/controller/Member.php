<?php
/**
 * thinkcmf     会员管理、提现申请
 * ============================================================================
 * Author: yizukeji.cn
 * Date: 2017/07/27 15:31
 */

namespace app\admin\controller;
use app\common\controller\Admin;
use think\AjaxPage;
use think\Page;
use think\Verify;
use think\Db;

class Member extends Admin {
    public  $users_type;
    /*
     * 初始化操作
     */
    public function _initialize() {
        parent::_initialize();
        config('TOKEN_ON',false); // 关闭表单令牌验证
        $data = M('users_type')->field('id,name')->select();//会员类型
        foreach($data as $key => $val){
            $users_type[$val['id']]['name'] = $val['name'];
        }
        $this->users_type = $users_type;
        // 订单 支付 发货状态
        $this->assign('data',$data);
        $this->assign('users_type',$this->users_type);
    }

    /*
     * 会员列表
     */
    public function index(){
		$this->setMeta('会员管理');
        return $this->fetch();
    }

    /**
     * 会员列表
     */
    public function ajaxindex(){
        // 搜索条件
        $condition = array();
        input('users_type') ? $condition['users_type'] = input('users_type') : false;
        input('mobile') ? $condition['mobile'] = input('mobile') : false;

        input('staff_id') ? $condition['staff_id'] = input('staff_id') : false; //
        input('beauty_id') ? $condition['beauty_id'] = input('beauty_id') : false; //
        input('beautician_id') ? $condition['beautician_id'] = input('beautician_id') : false; //
        input('customer_id') ? $condition['customer_id'] = input('customer_id') : false; //
        $sort_order = input('order_by').' '.input('sort');

        $model = M('users');
        $count = $model->where($condition)->count();
        $Page  = new AjaxPage($count,10);
        //  搜索条件下 分页赋值
        foreach($condition as $key=>$val) {
            $Page->parameter[$key]   =   urlencode($val);
        }
        $userList = $model->where($condition)->order($sort_order)->limit($Page->firstRow.','.$Page->listRows)->select();
        $show = $Page->show();
        $this->assign('userList',$userList);
        $this->assign('page',$show);// 赋值分页输出
        $this->assign('pager',$Page);
        return $this->fetch();
    }

    /**
     * 会员详细信息查看、修改会员信息
     */
    public function detail(){
        if(IS_POST){
            $data = input('post.');
            $user_id = $data['user_id'];
            if(empty($data['user_id'])){
                $this->error('会员不存在');
            }else{
                if(!empty($data['mobile']))
                {
                    $mobile = $data['mobile'];
                    if(!check_mobile($mobile)){
                        exit($this->error('手机号格式有误'));
                    }
                    $c = db('users')->where("user_id != $user_id and mobile = '$mobile'")->count();
                    $c && exit($this->error('手机号不得和已有用户重复'));
                }
                $row = db('users')->where("user_id = $user_id")->update($data);
                if($row)
                    exit($this->success('修改成功'));
                exit($this->error('未作内容修改或修改失败'));
            }
        }else{
            $uid = input('id');
            $user = M('users')->where(array('user_id'=>$uid))->find();
            if(!$user)
                exit($this->error('会员不存在'));
            switch ($user['users_type']){
                case 1:
                    //下级美容院数量
                    $count = M('users')->where(array('users_type'=>2,'staff_id'=>$user['user_id']))->count();
                    break;
                case 2:
                    //下级美容师数量
                    $count = M('users')->where(array('users_type'=>3,'beauty_id'=>$user['user_id']))->count();
                    break;
                case 3:
                    //下级顾客数量
                    $count = M('users')->where(array('users_type'=>4,'beautician_id'=>$user['user_id']))->count();
                    break;
                default:
                    //推荐顾客数量
                    $count = M('users')->where(array('users_type'=>4,'customer_id'=>$user['user_id']))->count();
            }

            //更新用户总佣金与可提现佣金
            //公司员工
            if($user['users_type'] == 1){
                $map['staff_id'] = $user['user_id'];
                $fleds = 'SUM(staff_id_commission) total';
            }
            //美容院
            if($user['users_type'] == 2){
                $map['beauty_id'] = $user['user_id'];
                $fleds = 'SUM(beauty_id_commission) total';
            }
            //美容师
            if($user['users_type'] == 3){
                $map['beautician_id'] = $user['user_id'];
                $fleds = 'SUM(beautician_id_commission) total';
            }
            //顾客
            if($user['users_type'] == 4){
                $map['customer_id'] = $user['user_id'];
                $fleds = 'SUM(customer_id_commission) total';
            }
            //总佣金
            $map['order_status'] = 2;
            $map['pay_status'] =1;
            $total = M('order')
                ->where($map)
                ->field($fleds)
                ->find();
            //已提现佣金
            $have['user_id'] = $user['user_id'];
            $have['status'] = ['>=',0];
            $havewithdrawal = M('withdrawals')
                ->where($have)
                ->field('SUM(money) money')
                ->find();
            //可提现金额
            $withdrawal = $total['total'] - $havewithdrawal['money'];
            db('users')->where(array('user_id'=>$user['user_id']))->update(array('user_money'=>$withdrawal,'distribut_money'=>$total['total']));

            $user['user_money'] = $withdrawal;
            $user['distribut_money'] = $total['total'];

            $this->assign('count',$count);
            $this->assign('user',$user);
            $this->setMeta("会员信息");
            return $this->fetch();
        }
    }

    /**
     * 删除会员
     */
    public function delete(){
        $uid = input('id');
        $row = M('users')->where(array('user_id'=>$uid))->delete();
        if($row){
            $this->success('成功删除会员');
        }else{
            $this->error('操作失败');
        }
    }


    /**
     * 会员类型
     */
    function users_type(){
        $map = array();
        $order = "sort asc,id asc";
        $list  = M('users_type')->where($map)->order($order)->paginate(10);
        $data = array(
            'list' => $list,
            'page' => $list->render(),
        );
        $this->assign($data);
        $this->setMeta("会员类型");
        return $this->fetch();
    }



    /**
     * 增加会员类型
     */
    function add_users_type(){
        $member = model('Member');
        if (IS_POST) {
            $data = input('post.');
            if ($data) {
                unset($data['id']);
                $result = $member->save($data);
                if ($result) {
                    return $this->success("添加成功！", url('member/user_type'));
                } else {
                    return $this->error($member->getError());
                }
            } else {
                return $this->error($member->getError());
            }
        } else {
            $data = array(
                'keyList' => $member->users_type_keyList,
            );
            $this->assign($data);
            $this->setMeta("添加会员类型");
            return $this->fetch('public/edit');
        }
    }

    /**
     * 修改会员类型
     */
    function edit_users_type(){
        $member = model('Member');
        $id   = input('id', '', 'trim,intval');
        if (IS_POST) {
            $data = input('post.');
            if ($data) {
                $result = $member->save($data, array('id' => $data['id']));
                if ($result) {
                    return $this->success("修改成功！", url('Member/user_type'));
                } else {
                    return $this->error("修改失败！");
                }
            } else {
                return $this->error($member->getError());
            }
        } else {
            $map  = array('id' => $id);
            $info = db('users_type')->where($map)->find();
            $data = array(
                'keyList' => $member->users_type_keyList,
                'info'    => $info,
            );
            $this->assign($data);
            $this->setMeta("编辑会员类型");
            return $this->fetch('public/edit');
        }
    }

    /**
     * 删除会员类型
     */
    function del_users_type(){
        $id = $this->getArrayParam('id');
        if (empty($id)) {
            return $this->error('非法操作！');
        }
        $users_type = db('users_type');

        $map    = array('id' => array('IN', $id));
        $result = $users_type->where($map)->delete();
        if ($result) {
            return $this->success("删除成功！");
        } else {
            return $this->error("删除失败！");
        }
    }



    /**
     * 美容院详细信息
     */
    public function beautydetail(){
        $uid = input('id');
        $user = M('beauty_salon')->where(array('user_id'=>$uid))->find();
        if(!$user)
            exit($this->error('还未填写资料'));
        $this->assign('user',$user);
        $this->setMeta("美容院详细信息");
        return $this->fetch();
    }


    /**
     * 导出会员信息
     */
    public function export_user(){
    	$strTable ='<table width="500" border="1">';
    	$strTable .= '<tr>';
    	$strTable .= '<td style="text-align:center;font-size:12px;width:120px;">会员ID</td>';
    	$strTable .= '<td style="text-align:center;font-size:12px;" width="100">会员昵称</td>';
    	$strTable .= '<td style="text-align:center;font-size:12px;" width="*">会员等级</td>';
    	$strTable .= '<td style="text-align:center;font-size:12px;" width="*">手机号</td>';
    	$strTable .= '<td style="text-align:center;font-size:12px;" width="*">邮箱</td>';
    	$strTable .= '<td style="text-align:center;font-size:12px;" width="*">注册时间</td>';
    	$strTable .= '<td style="text-align:center;font-size:12px;" width="*">最后登陆</td>';
    	$strTable .= '<td style="text-align:center;font-size:12px;" width="*">余额</td>';
    	$strTable .= '<td style="text-align:center;font-size:12px;" width="*">积分</td>';
    	$strTable .= '<td style="text-align:center;font-size:12px;" width="*">累计消费</td>';
    	$strTable .= '</tr>';
    	$count = M('users')->count();
    	$p = ceil($count/5000);
    	for($i=0;$i<$p;$i++){
    		$start = $i*5000;
    		$end = ($i+1)*5000;
    		$userList = M('users')->order('user_id')->limit($start.','.$end)->select();
    		if(is_array($userList)){
    			foreach($userList as $k=>$val){
    				$strTable .= '<tr>';
    				$strTable .= '<td style="text-align:center;font-size:12px;">'.$val['user_id'].'</td>';
    				$strTable .= '<td style="text-align:left;font-size:12px;">'.$val['nickname'].' </td>';
    				$strTable .= '<td style="text-align:left;font-size:12px;">'.$val['level'].'</td>';
    				$strTable .= '<td style="text-align:left;font-size:12px;">'.$val['mobile'].'</td>';
    				$strTable .= '<td style="text-align:left;font-size:12px;">'.$val['email'].'</td>';
    				$strTable .= '<td style="text-align:left;font-size:12px;">'.date('Y-m-d H:i',$val['reg_time']).'</td>';
    				$strTable .= '<td style="text-align:left;font-size:12px;">'.date('Y-m-d H:i',$val['last_login']).'</td>';
    				$strTable .= '<td style="text-align:left;font-size:12px;">'.$val['user_money'].'</td>';
    				$strTable .= '<td style="text-align:left;font-size:12px;">'.$val['pay_points'].' </td>';
    				$strTable .= '<td style="text-align:left;font-size:12px;">'.$val['total_amount'].' </td>';
    				$strTable .= '</tr>';
    			}
    			unset($userList);
    		}
    	}
    	$strTable .='</table>';
    	downloadExcel($strTable,'users_'.$i);
    	exit();
    }


    /**
     * 提现申请记录
     */
    public function withdrawals()
    {
        $model = M("withdrawals");
        $_GET = array_merge($_GET,$_POST);
        unset($_GET['create_time']);

        $status = input('status');
        $user_id = input('user_id');
        $account_bank = input('account_bank');
        $account_name = input('account_name');
        $create_time = input('create_time');
        $create_time = $create_time  ? $create_time  : date('Y/m/d',strtotime('-1 year')).'-'.date('Y/m/d',strtotime('+1 day'));
        $create_time2 = explode('-',$create_time);
        $this->assign('start_time', $create_time2[0]);
        $this->assign('end_time', $create_time2[1]);
        $where = " create_time >= '".strtotime($create_time2[0])."' and create_time <= '".strtotime($create_time2[1])."' ";

        if($status === '0' || $status > 0)
            $where .= " and status = $status ";
        $user_id && $where .= " and user_id = $user_id ";
        $account_bank && $where .= " and account_bank like '%$account_bank%' ";
        $account_name && $where .= " and account_name like '%$account_name%' ";

        $count = $model->where($where)->count();
        $Page  = new Page($count,16);
        $list = $model->where($where)->order("`id` desc")->limit($Page->firstRow.','.$Page->listRows)->select();

        $this->assign('create_time',$create_time);
        $show  = $Page->show();
        $this->assign('show',$show);
        $this->assign('pager',$Page);
        $this->assign('list',$list);
        config('TOKEN_ON',false);
        $this->setmeta('提现申请');
        return $this->fetch();
    }

    /**
     * 删除申请记录
     */
    public function delWithdrawals()
    {
        $model = M("withdrawals");
        $model->where('id',input('id'))->delete();
        $return_arr = array('status' => 1,'msg' => '操作成功','data'  =>'',);   //$return_arr = array('status' => -1,'msg' => '删除失败','data'  =>'',);
        $this->ajaxReturn($return_arr);
    }

    /**
     * 修改编辑 申请提现
     */
    public function editWithdrawals()
    {
        $id = input('id');
        $withdrawals = M('withdrawals')->where('id',$id)->find();
        $user = M('users')->where('user_id',$withdrawals['user_id'])->find();
        if (IS_POST) {
            $data = input('post.');
            // 确认转账并备注
            if ($data['status'] == 1 && $withdrawals['status'] != 1) {
                if ($user['user_money'] < $withdrawals['money']) {
                    $this->error("用户余额不足{$withdrawals['money']}，不够提现");
                    exit;
                }
            }
            M('withdrawals')->update($data);
            $this->success("操作成功!", url('Admin/member/withdrawals'), 3);
            exit;
        }

        if ($user['nickname'])
            $withdrawals['user_name'] = $user['nickname'];
        $this->assign('user', $user);
        $this->assign('data', $withdrawals);
        $this->setMeta('提现申请详情');
        return $this->fetch();
    }

    public function withdrawals_update(){
        $id = input('id/a');
        $status = input('status');
        $withdrawals = M('withdrawals')->where('id','in', $id)->select();
        if($status == 1){
            $r = M('withdrawals')->where('id','in', $id)->save(array('status'=>$status,'check_time'=>time()));
        }else if($status == -1){
            $r = M('withdrawals')->where('id','in', $id)->save(array('status'=>$status,'refuse_time'=>time()));
        }else if($status == 2){
            foreach($withdrawals as $val){
                $user = M('users')->where(array('user_id'=>$val['user_id']))->find();
                if($user['user_money'] < $val['money'])
                {
                    $data['status'] = -2;
                    $data['remark'] = '账户余额不足';
                    M('withdrawals')->where(array('id'=>$val['id']))->save($data);
                }else{
                    if($val['bank_name'] == '支付宝 '){
                        //流水号1^收款方账号1^收款账号姓名1^付款金额1^备注说明1|流水号2^收款方账号2^收款账号姓名2^付款金额2^备注说明2
                        $alipay['batch_no'] = time();
                        $alipay['batch_fee'] += $val['money'];
                        $alipay['batch_num'] += 1;
                        $str = isset($alipay['detail_data']) ? '|' : '';
                        $alipay['detail_data'] .= $str.$val['pay_code'].'^'.$val['account_bank'].'^'.$val['realname'].'^'.$val['money'].'^'.$val['remark'];
                    }
                    if($val['bank_name'] == '微信'){
                        $wxpay = array(
                            'userid' => $val['user_id'],//用户ID做更新状态使用
                            'openid' => $val['account_bank'],//收钱的人微信 OPENID
                            'pay_code'=>$val['pay_code'],//提现申请ID
                            'money' => $val['money'],//金额
                            'desc' => '恭喜您提现申请成功!'
                        );
                        $res = $this->transfer('weixin',$wxpay);//微信在线付款转账
                        if($res['partner_trade_no']){
                            accountLog($val['user_id'], ($val['money'] * -1), 0,"平台处理用户提现申请");
                            $r = M('withdrawals')->where(array('id'=>$val['id']))->save(array('status'=>$status,'pay_time'=>time()));
                        }else{
                            $this->ajaxReturn(array('status'=>0,'msg'=>$res['msg']),'JSON');
                        }
                    }
                }
            }
            if(!empty($alipay)){
                $this->transfer('alipay',$alipay);
            }
            $this->ajaxReturn(array('status'=>1,'msg'=>"操作成功"),'JSON');
        }else if($status == 3){
            $r = M('withdrawals')->where('id in ('.implode(',', $id).')')->delete();
        }else{
            accountLog($val['user_id'], ($val['money'] * -1), 0,"管理员处理用户提现申请");//手动转账，默认视为已通过线下转方式处理了该笔提现申请
            $r = M('withdrawals')->where('id in ('.implode(',', $id).')')->save(array('status'=>2,'pay_time'=>time()));
        }
        if($r){
            $this->ajaxReturn(array('status'=>1,'msg'=>"操作成功"),'JSON');
        }else{
            $this->ajaxReturn(array('status'=>0,'msg'=>"操作失败"),'JSON');
        }

    }

    public function transfer($atype,$data){
        if($atype == 'weixin'){
            include_once  PLUGIN_PATH."payment/weixin/weixin.class.php";
            $wxpay_obj = new \weixin();
            return $wxpay_obj->transfer($data);
        }else{
            //支付宝在线批量付款
            include_once  PLUGIN_PATH."payment/alipay/alipay.class.php";
            $alipay_obj = new \alipay();
            return $alipay_obj->transfer($data);
        }
    }

    /**
     *  转账汇款记录
     */
    public function remittance(){
        $model = M("remittance");
        $_GET = array_merge($_GET,$_POST);
        unset($_GET['create_time']);

        $user_id = input('user_id');
        $account_bank = input('account_bank');
        $account_name = input('account_name');

        $create_time = input('create_time');
        $create_time = $create_time  ? $create_time  : date('Y-m-d',strtotime('-1 year')).' - '.date('Y-m-d',strtotime('+1 day'));
        $create_time2 = explode(' - ',$create_time);
        $this->assign('start_time',$create_time2[0]);
        $this->assign('end_time',$create_time2[1]);
        $where = " create_time >= '".strtotime($create_time2[0])."' and create_time <= '".strtotime($create_time2[1])."' ";
        $user_id && $where .= " and user_id = $user_id ";
        $account_bank && $where .= " and account_bank like '%$account_bank%' ";
        $account_name && $where .= " and account_name like '%$account_name%' ";

        $count = $model->where($where)->count();
        $Page  = new Page($count,16);
        $list = $model->where($where)->order("`id` desc")->limit($Page->firstRow.','.$Page->listRows)->select();
        $this->assign('pager',$Page);
        $this->assign('create_time',$create_time);
        $show  = $Page->show();
        $this->assign('show',$show);
        $this->assign('list',$list);
        config('TOKEN_ON',false);
        return $this->fetch();
    }






}