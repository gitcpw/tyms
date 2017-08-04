<?php


/**
 * 生成二维码
 */
function create_qrcode(){
    $rs = db('wechat_qrcode')
        ->field('type, scene_id, expire_seconds, qrcode_url, status')
        ->where('scene_id = ' . $this->user_id)
        ->find();
    if (empty($rs)) {
        $data['username'] = $this->user['nickname'];   //推荐人
        $data['scene_id'] = $this->user_id;     //推荐人id
        $data['type']     = '1';   //0临时 1永久
        $data['wechat_id']= '25';   //公众号ID
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

//关注
if($postObj->Event == 'subscribe'){

    // 用户注册
    $scene_id  = str_replace('qrscene_','',$postObj->EventKey);
    $scene_id  = empty($scene_id) ? 0 : $scene_id;
    $parent_id = db("users")->where(array('user_id'=>$scene_id))->value('user_id');
    $parent_id = empty($parent_id) ? 0 : $parent_id;

    if($parent_id){
        $map = array();
        $is_exist = Db::query("select user_id from lx_users where openid='{$fromUsername}'");
        if(!$is_exist){
            //会员不存在则添加一个
            $map['openid']    = (string)$fromUsername;
            $map['parent_id'] = $parent_id;
            $map['password']  = '';
            $map['nickname']  = 'wx_'.date('YmdHis').mt_rand(100,999);
            $map['oauth']     = 'weixin';
            $map['reg_time']  = time();
            $row_id = db('users')->insertGetId($map);

            //添加模拟劵
            if($row_id){
                do{
                    $code = mt_rand(10000000,99999999);//获取随机8位字符串
                    $check_exist = db('coupon_list')->where(array('code'=>$code))->value('code');
                }while($check_exist);
                db('coupon_list')->insert(array('uid'=>$row_id,'send_time'=>time(),'code'=>$code));
            }
        }
    }

    $textTpl = "<xml>
                <ToUserName><![CDATA[%s]]></ToUserName>
                <FromUserName><![CDATA[%s]]></FromUserName>
                <CreateTime>%s</CreateTime>
                <MsgType><![CDATA[%s]]></MsgType>
                <Content><![CDATA[%s]]></Content>
                <FuncFlag>0</FuncFlag>
                </xml>";
    $contentStr = config('wx_subscribe');
    $resultStr = sprintf($textTpl, $fromUsername, $toUsername, $time, 'text', $contentStr);
    exit($resultStr);
}