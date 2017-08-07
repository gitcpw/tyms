<?php
// +----------------------------------------------------------------------
// | YizuCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.yizukeji.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: liuxing <464401240@qq.com> <http://www.yizukeji.cn>
// +----------------------------------------------------------------------

namespace app\index\controller;
use app\common\controller\Fornt;

class Index extends Fornt {




    //网站首页
	public function index() {		//设置SEO
		$this->setSeo(config('web_site_title'), config('web_site_keyword'), config('web_site_description'));
		return $this->fetch();
	}

    /*
     * 我的分享
     * */
    public function share(){
        $pid = input('pid/d',$this->user_id);
        if($pid == $this->user_id){
            $qrcode_url = $this->create_qrcode();//得到二维码
        }else{
            $qrcode_url = db('wechat_qrcode')->where('scene_id = ' . $pid)->value('qrcode_url');
        }

        $child_num = db('users')->where('parent_id', $this->user_id)->count();
        $this->assign('child_num', $child_num);
        $this->assign('pid', $pid);
        $this->assign('uid', $this->user_id);
        $this->assign('qrcode_url', $qrcode_url);
        return $this->fetch();
    }

    /**
     * 生成二维码
     */
    public function create_qrcode()
    {
        $rs = db('wechat_qrcode')
            ->field('type, scene_id, expire_seconds, qrcode_url, status')
            ->where('scene_id = ' . $this->user_id)
            ->find();
        if (empty($rs)) {
            $data['username'] = $this->user['nickname'];   //推荐人
            $data['scene_id'] = $this->user_id;     //推荐人id
            $data['type'] = '1';   //0临时 1永久
            $data['wechat_id'] = '25';   //公众号ID
            $data['function'] = '';    //功能
            $rs['qrcode_url'] = $data['qrcode_url'] = ''; //二维码地址
            //新增一个二维码
            db('wechat_qrcode')->data($data)->insert();
        }
        if (empty($rs['qrcode_url'])) {
            $wxinfo = db('wx_user')->field('id, w_token, appid, appsecret, type')->where('wait_access = 1')->find();
            $config['token'] = $wxinfo['w_token'];
            $config['appid'] = $wxinfo['appid'];
            $config['appsecret'] = $wxinfo['appsecret'];
            $weObj = new \data\Wechat($config);

            // 获取二维码ticket
            $ticket = $weObj->getQRCode($this->user_id, 1, 1800);
            if (empty($ticket)) {
                header("location:" . url('share'));
                exit;
            }
            $data['ticket'] = $ticket['ticket'];
//            if(!$data['type']){
//                $data['expire_seconds'] = $ticket['expire_seconds'];
//                $data['endtime'] = time() + $ticket['expire_seconds'];
//            }

            // 二维码地址
            $qrcode_url = $weObj->getQRUrl($ticket['ticket']);
            $data['qrcode_url'] = $qrcode_url;

            db('wechat_qrcode')->where('scene_id = ' . $this->user_id)->update($data);
        } else {
            $qrcode_url = $rs['qrcode_url'];
        }

        if($qrcode_url){
            return $qrcode_url;
        }
    }

}
