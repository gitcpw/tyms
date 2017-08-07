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

    }

    //个人中心首页
	public function index() {
        //查询会员类型数据
        $users_type = M('users_type')->where('id',$this->user['users_type'])->find();
        $this->assign('user',$this->user);
        $this->assign('users_type',$users_type);
        $this->setMeta('会员中心');
        return $this->fetch();
	}

    //我的钱包
    public function wallet(){
        //公司员工
        if($this->user['users_type'] == 1){
            //总佣金
            $total = M('order')
                    ->where('staff_id',$this->user['user_id'])
                    ->where('order_status','>',0)
                    ->where('pay_status','>',0)
                    ->field('SUM(staff_id_commission)')
                    ->select();
            //
            //可提现佣金
            $withdraw = M('order')
                        ->where('staff_id',$this->user['user_id'])
                        ->where('order_status','=',2)
                        ->where('pay_status','=',1)
                        ->field('SUM(staff_id_commission)')
                        ->select();
        }
        //美容院
        if($this->user['users_type'] == 2){

        }
        //美容师
        if($this->user['users_type'] == 3){

        }
        //顾客
        if($this->user['users_type'] == 4){
            //由别的顾客推荐
            if($this->user['customer_id'] > 0){

            }else{  //由美容师推荐

            }
        }



        $this->setMeta('我的钱包');
        return $this->fetch();
    }

    //分享记录
    public function sharelog(){
        $users = db('users')->where(array('user_id' => $this->user['user_id']))->field('nickname')->find();
        $this->setMeta('分享记录');
        return $this->fetch();
    }

    //我要分享
    public function share(){
        $users = db('users')->where(array('user_id' => $this->user['user_id']))->field('nickname')->find();
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
        $users = db('users')->where(array('user_id' => $this->user['user_id']))->field('nickname')->find();
        $this->setMeta('员工管理');
        return $this->fetch();
    }

    //美容院优惠券管理
    public function beautycoupons(){
        $users = db('users')->where(array('user_id' => $this->user['user_id']))->field('nickname')->find();
        $this->setMeta('美容院优惠券管理');
        return $this->fetch();
    }

    //美容院信息管理
    public function storeinfo(){
        $users = db('users')->where(array('user_id' => $this->user['user_id']))->field('nickname')->find();
        $this->setMeta('美容院信息管理');
        return $this->fetch();
    }





    //提现申请
    public function withdraw(){
        $users = db('users')->where(array('user_id' => $this->user['user_id']))->field('nickname')->find();
        $this->setMeta('提现申请');
        return $this->fetch();
    }


}
