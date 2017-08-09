<?php
//会员前端模块

namespace app\index\controller;
use app\common\controller\Fornt;

class Member extends Fornt {
    public $session;
    public $user;

    public function _initialize() {
        parent::_initialize();
        //查询会员sesson
        $this->session = session('user');
        $this->user = M('users')->where('user_id',$this->session['user_id'])->find();
        $this->update_withdraw();

    }


    //个人中心首页
    public function index() {
        //查询会员类型数据
        $this->cominfo();
        $users_type = M('users_type')->where('id',$this->user['users_type'])->find();
        $this->assign('user',$this->user);
        $this->assign('users_type',$users_type);
        $this->setMeta('会员中心');
        return $this->fetch();
    }

    //我的钱包
    public function wallet(){
        $this->update_withdraw();
        //订单列表
        $ordermap['order_status'] = ['>',0];
        $ordermap['pay_status'] = ['>',0];
        $orderList = M('order')->where($ordermap)->select();

        $this->assign('user',$this->user);
        $this->assign('orderList',$orderList);
        $this->setMeta('我的钱包');
        return $this->fetch();
    }

    //分享记录
    public function sharelog(){
        //1浏览未下单 2下单未付款 3已付款
        $type = input('type');
        if(empty($type) || $type == 0){
            $where['is_buy'] = ['=',0];
        }
        if($type == 1){
            $where['is_buy'] = ['=',1];
        }
        if($type == 2){
            $where['is_buy'] = ['=',2];
        }
        //公司员工
        if($this->user['users_type'] == 1){
            $where['staff_id'] = ['=',$this->user['user_id']];
            $where['users_type'] = ['=',2];
            $userlist = M('users')->where($where)->select();
        }
        //美容院
        if($this->user['users_type'] == 2){
            $where['beauty_id'] = ['=',$this->user['user_id']];
            $where['users_type'] = ['=',3];
            $userlist = M('users')->where($where)->select();
        }
        //美容师
        if($this->user['users_type'] == 3){
            $where['beautician_id'] = ['=',$this->user['user_id']];
            $where['users_type'] = ['=',4];
            $userlist = M('users')->where($where)->select();
        }
        //顾客
        if($this->user['users_type'] == 4){
            $where['customer_id'] = ['=',$this->user['user_id']];
            $where['users_type'] = ['=',4];
            $userlist = M('users')->where($where)->select();
        }
        $this->assign('userlist',$userlist);
        $this->assign('user',$this->user);
        $this->setMeta('分享记录');
        return $this->fetch();
    }

    //我要分享
    public function share(){
        //公司员工
        if(($this->user['users_type'] ==  1 || $this->user['users_type'] == 2) && $this->user['is_distribut'] == 0){
            $this->error('请等待管理员审核您的分享资格！');
        }
        //美容师
        if($this->user['users_type'] == 3 && $this->user['is_distribut'] == 0){
            $this->error('请等待美容院审核您的员工资格！');
        }
        //顾客
        if($this->user['users_type'] == 4 && $this->user['is_distribut'] == 0){
            $this->error('您还没有分销资格，请先购买产品！');
        }
        $this->setMeta('我要分享');
        return $this->fetch();
    }

    //美容院分享管理
    public function sharemanage(){
        $users = db('users')->where(array('user_id' => $this->user['user_id']))->field('nickname')->find();
        $this->setMeta('分享管理');
        return $this->fetch();
    }

    //美容院员工管理
    public function staffmanage(){

        $this->setMeta('员工管理');
        return $this->fetch();
    }

    //美容师删除列表
    public function staffdelete(){
        $beauticianlist = M('users')->where(array('users_type'=>3,'beauty_id'=>$this->user['user_id'],'is_distribut'=>1))->select();
        $this->assign('beauticianlist',$beauticianlist);
        $this->setMeta('美容师删除列表');
        return $this->fetch();
    }


    //美容师申请列表
    public function apply(){
        $beauticianlist = M('users')->where(array('users_type'=>3,'beauty_id'=>$this->user['user_id'],'is_distribut'=>0))->select();
        $this->assign('beauticianlist',$beauticianlist);
        $this->setMeta('美容师申请列表');
        return $this->fetch();
    }

    //美容师申请同意
    public function staffagreed(){
        if(empty(input('uid'))){
            exit('');
        }else{
            $row = M('users')->where('user_id',input('uid'))->update(array('is_distribut'=>1));
            if($row){
                exit(json_encode(array('msg'=>'处理成功！','url'=>url('member/apply'))));
            }else{
                exit(json_encode(array('msg'=>'处理失败！','url'=>url('member/apply'))));
            }
        }
    }

    //美容师申请拒绝
    public function staffnoagreed(){
        if(empty(input('uid'))){
            exit('');
        }else{
            $row = M('users')->where('user_id',input('uid'))->delete();
            if($row){
                exit(json_encode(array('msg'=>'处理成功！','url'=>url('member/apply'))));
            }else{
                exit(json_encode(array('msg'=>'处理失败！','url'=>url('member/apply'))));
            }
        }

    }







    //美容院优惠券管理
    public function beautycoupons(){
        $users = db('users')->where(array('user_id' => $this->user['user_id']))->field('nickname')->find();
        $this->setMeta('美容院优惠券管理');
        return $this->fetch();
    }

    //美容院信息管理
    public function storeinfo(){
        if(IS_POST){

        }else{
            $info = M('beauty_salon')->where('user_id',$this->user['user_id'])->find();
            $imagesarr = db('beauty_salon_img')->where('user_id',$this->user['user_id'])->column('img','id');
            $this->assign('info',$info);
            $this->assign('imagesarr',$imagesarr);
            return $this->fetch();
        }
    }

    public function upload_img(){
        $data['user_id'] = $this->user['user_id'];
        //上传图片
        $file = $this->upload('file');
        if(!file_exists($file)){
            die($file);
        }
        $data['img'] = $file;
        db('beauty_salon_img')->insert($data);
        exit($file);
    }

    public function delImg(){
        $whe['img'] = input('file','trim');
        $whe['user_id'] = $this->user['user_id'];
        if(db('beauty_salon_img')->where($whe)->delete()){
            unlink($whe['img']);
        }
    }



    //修改优惠券
    public function editcoupon(){
        if(IS_POST){

        }else{
            return $this->fetch();
        }
    }


    //顾客我的优惠券
    public function mycoupon(){
        return $this->fetch();
    }

    //顾客我的订单
    public function myorder(){
        $order = M('order')->where('user_id',$this->user['user_id'])->field('order_status,pay_status')->find();
        $this->assign('order',$order);
        $this->assign('user',$this->user);
        $this->setMeta('我的订单');
        return $this->fetch();
    }

    //顾客百问百答
    public function news(){
        $cid = input('id');
        if(empty($cid)){
            $cate = M('category')->order('id asc')->find();
            $cid = $cate['id'];
            $where['category_id'] = ['=',$cid];
        }else{
            $where['category_id'] = ['=',$cid];
        }
        $categorys = M('category')->select();
        //默认出来的文章列表
        $article = M('article')->where($where)->select();
        $this->assign('category',$categorys);
        $this->assign('article',$article);
        return $this->fetch();
    }

    //顾客百问百答详情页
    public function newsdetail(){
        $id = input('id');
        if(empty($id)){
            $this->error('文章不存在');
        }else{
            $info = M('article')->where('id',$id)->find();
            $this->assign('info',$info);
            $this->setMeta('百问百答详情页');
            return $this->fetch();
        }
    }


    //顾客服务商家
    public function myshop(){
        return $this->fetch();
    }


    //提现申请
    public function withdraw(){
        if(IS_POST){
            $data = input('post.');
            //提现金额小于等于用户可提现金额,大于等于100
            if($data['bank_name'] == ''){
                exit(json_encode(array('status'=>-1,'msg'=>"请填写开户行")));
            }
            if($data['account_bank'] == ''){
                exit(json_encode(array('status'=>-2,'msg'=>"请填写账号")));
            }
            if($data['account_name'] == ''){
                exit(json_encode(array('status'=>-3,'msg'=>"请填写户名")));
            }
            if($data['money'] >= 100){
                if($data['money'] <= $this->user['user_money']){
                    $data['user_id'] = $this->user['user_id'];
                    $data['create_time'] = time();
                    $row = db('withdrawals')->insert($data);
                    $this->update_withdraw();
                    $row ? exit(json_encode(array('status'=>1,'msg'=>"申请成功！",'url'=>url('member/withdrawlog')))) : exit(json_encode(array('status'=>-5,'msg'=>"申请失败！",'url'=>url('member/withdrawlog'))));
                }else{
                    exit(json_encode(array('status'=>-6,'msg'=>"提现金额超出上限")));
                }
            }else{
                exit(json_encode(array('status'=>-4,'msg'=>"提现金额不得少于100")));
            }
        }else{
            $this->assign('user',$this->user);
            $this->setMeta('提现申请');
            return $this->fetch();
        }
    }

    /*
     * 提现记录
     */
    public function withdrawlog(){
        $this->update_withdraw();
        $withdrawList = M('withdrawals')->where('user_id',$this->user['user_id'])->select();
        $this->assign('withdrawList',$withdrawList);
        $this->setMeta('提现记录');
        return $this->fetch();
    }

    /*
     * 更新用户总佣金与可提现佣金
     */
    public function update_withdraw(){
        //更新用户总佣金与可提现佣金
        //公司员工
        if($this->user['users_type'] == 1){
            $map['staff_id'] = $this->user['user_id'];
            $fleds = 'SUM(staff_id_commission) total';
        }
        //美容院
        if($this->user['users_type'] == 2){
            $map['beauty_id'] = $this->user['user_id'];
            $fleds = 'SUM(beauty_id_commission) total';
        }
        //美容师
        if($this->user['users_type'] == 3){
            $map['beautician_id'] = $this->user['user_id'];
            $fleds = 'SUM(beautician_id_commission) total';
        }
        //顾客
        if($this->user['users_type'] == 4){
            $map['customer_id'] = $this->user['user_id'];
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
        $have['user_id'] = $this->user['user_id'];
        $have['status'] = ['>=',0];
        $havewithdrawal = M('withdrawals')
            ->where($have)
            ->field('SUM(money) money')
            ->find();
        //可提现金额
        $withdrawal = $total['total'] - $havewithdrawal['money'];
        db('users')->where(array('user_id'=>$this->user['user_id']))->update(array('user_money'=>$withdrawal,'distribut_money'=>$total['total']));
    }

    /**
     * 会员首页公共信息
     */
    public function cominfo(){
        switch ($this->user['users_type']){
            case 1:
                $npmap['staff_id'] = $ipmap['staff_id'] = $tmap['staff_id'] = $tdmap['staff_id'] = $wkmap['staff_id'] = ['=',$this->user['user_id']];
                $fleds = 'SUM(staff_id_commission) total';
                break;
            case 2:
                $npmap['beauty_id'] = $ipmap['beauty_id'] = $tmap['beauty_id'] = $tdmap['beauty_id'] = $wkmap['beauty_id'] = ['=',$this->user['user_id']];
                $fleds = 'SUM(beauty_id_commission) total';
                break;
            case 3:
                $npmap['beautician_id'] = $ipmap['beautician_id'] = $tmap['beautician_id'] = $tdmap['beautician_id'] = $wkmap['beautician_id'] = ['=',$this->user['user_id']];
                $fleds = 'SUM(beautician_id_commission) total';
                break;
            case 4:
                if($this->user['customer_id'] >0){
                    $npmap['customer_id'] = $ipmap['customer_id'] = $tmap['customer_id'] = $tdmap['customer_id'] = $wkmap['customer_id'] = ['=',$this->user['user_id']];
                }else{
                    $npmap['beautician_id'] = $ipmap['beautician_id'] = $tmap['beautician_id'] = $tdmap['beautician_id'] = $wkmap['beautician_id'] = ['=',$this->user['user_id']];
                }
                $fleds = 'SUM(customer_id_commission) total';
                break;
            default;
        }
        //今日收入
        $beginToday = mktime(0, 0, 0, date('m'), date('d'), date('Y'));
        $endToday =    mktime(23, 59, 59, date('m'), date('d'), date('Y'));
        $tdmap['order_status'] = ['=',2];
        $today_income = M('order')
            ->whereTime('hexiao_time','between',[$beginToday,$endToday])
            ->where($tdmap)
            ->field($fleds)
            ->find();
        //本周收入
        $beginWeek =  strtotime(date('Y-m-d', strtotime("this week Monday", time())));
        $endWeek =   strtotime(date('Y-m-d', strtotime("this week Sunday", time()))) + 24 * 3600 - 1;
        $wkemap['order_status'] = ['=',2];
        $week_income = M('order')
            ->whereTime('hexiao_time','between',[$beginWeek,$endWeek])
            ->where($wkemap)
            ->field($fleds)
            ->find();
        //分享量
        $tmap['users_type'] = ['=',4];
        $totalfen = M('users')
            ->where($tmap)
            ->field('count(user_id) count')
            ->find();
        //已下单
        $npmap['users_type'] = ['=',4];
        $npmap['is_buy'] = ['=',1];
        $nopayfen = M('users')
            ->where($npmap)
            ->field('count(user_id) count')
            ->find();
        //已付款
        $ipmap['users_type'] = ['=',4];
        $ipmap['is_buy'] = ['=',2];
        $ispayfen = M('users')
            ->where($ipmap)
            ->field('count(user_id) count')
            ->find();
        $this->assign('today_income',$today_income['total']);
        $this->assign('week_income',$week_income['total']);
        $this->assign('totalfen',$totalfen['count']);
        $this->assign('nopayfen',$nopayfen['count']);
        $this->assign('ispayfen',$ispayfen['count']);
    }


}
