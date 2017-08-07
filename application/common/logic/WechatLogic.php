<?php
/**
 * tpshop
 * ============================================================================
 * 版权所有 2015-2027 深圳搜豹网络科技有限公司，并保留所有权利。
 * 网站地址: http://www.tp-shop.cn
 * ----------------------------------------------------------------------------
 * 这不是一个自由软件！您只能在不用于商业目的的前提下对程序代码进行修改和使用 .
 * 不允许对程序代码以任何形式任何目的的再发布。
 * 如果商业用途务必到官方购买正版授权, 以免引起不必要的法律纠纷.
 * ============================================================================
 */

namespace app\common\logic;
use app\common\util\WechatUtil;
use think\Image;

class WechatLogic
{
    private $wx_user;
    private $wechatObj;
    
    public function __construct()
    {
        $this->wx_user = M('wx_user')->find();
        if ($this->wx_user['wait_access'] == 0) {
            exit($_GET["echostr"]);
        }
        $this->wechatObj = new WechatUtil($this->wx_user);
    }

    /**
     * 处理接收推送消息
     */
    public function handleMessage()
    {
        $wechatObj = $this->wechatObj;
        $msg = $wechatObj->handleMessage();
        if (!$msg) {
            exit($wechatObj->getError());
        }

        if ($msg['MsgType'] == 'event') {
            if ($msg['Event'] == 'subscribe') {
                $ret = $this->handleSubscribeEvent($msg);//关注事件
                $this->ajaxReturn($ret);
            } elseif ($msg['Event'] == 'SCAN') {
                //已关注事件
            } elseif ($msg['Event'] == 'CLICK') {
                $this->handleClickEvent($msg);//点击事件
            }
        } elseif ($msg['MsgType'] == 'text') {
            $this->handleTextMsg($msg);//用户输入文本
        }

        $this->replyDefault($msg);
    }
    
    /**
     * 处理关注事件
     * @param array $msg
     * @return type
     */
    private function handleSubscribeEvent($msg)
    {
        $openid = $msg['FromUserName'];//用户的openid。
        $toUsername = $msg['ToUserName'];      //商户的公众号原始id。
        $time = time();

        if (!$openid) {
             return ['status' => -1, 'msg' => "openid无效"];
        }
        
        if ($msg['MsgType'] != 'event' || $msg['Event'] != 'subscribe') {
            return ['status' => 1, 'msg' => "不是关注事件"];
        }

        if (!($user = M('users')->where('openid', $openid)->find())) {
            $user = [
                'openid'    => $openid,
                'reg_time'  => time(),
                'token'     => md5(time().mt_rand(1,99999)),
            ];

            // 由场景值获取分销一级id
            if (!empty($msg['EventKey'])) {
                $sent_id = substr($msg['EventKey'], strlen('qrscene_'));
                if ($sent_id) {
                    $first_leader = M('users')->where('user_id', $sent_id)->find();
                    if ($first_leader) {
                        switch ($first_leader['users_type']){
                            case 1:
                                $user['users_type'] = 2;
                                $user['staff_id'] = $first_leader['user_id'];
                                break;
                            case 2:
                                $user['users_type'] = 3;
                                $user['staff_id'] = $first_leader['staff_id'];
                                $user['beauty_id'] = $first_leader['user_id'];
                                break;
                            case 3:
                                $user['users_type'] = 4;
                                $user['staff_id'] = $first_leader['staff_id'];
                                $user['beauty_id'] = $first_leader['beauty_id'];
                                $user['beautician_id'] = $first_leader['user_id'];
                                break;
                            default:
                                $user['users_type'] = 4;
                                $user['staff_id'] = $first_leader['staff_id'];
                                $user['beauty_id'] = $first_leader['beauty_id'];
                                $user['beautician_id'] = $first_leader['beautician_id'];
                                $user['customer_id'] = $first_leader['user_id'];
                        }
                        //他上线分销的下线人数要加1
                        //M('users')->where('user_id', $user['first_leader'])->setInc('underling_number');
                        //M('users')->where('user_id', $user['second_leader'])->setInc('underling_number');
                        //M('users')->where('user_id', $user['third_leader'])->setInc('underling_number');
                    }
                }
            }

            $user_id = M('users')->insertGetId($user);
            if (!$user_id) {
                return ['status' => -1, 'msg' => "保存数据出错"];
            }

            $this->create_qrcode($user_id);

        }

        $textTpl = "<xml>
                    <ToUserName><![CDATA[%s]]></ToUserName>
                    <FromUserName><![CDATA[%s]]></FromUserName>
                    <CreateTime>%s</CreateTime>
                    <MsgType><![CDATA[%s]]></MsgType>
                    <Content><![CDATA[%s]]></Content>
                    <FuncFlag>0</FuncFlag>
                    </xml>";
        $contentStr = '<a href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx607a95578a618a8b&redirect_uri=http://tianyimeishan.yizukeji.cn&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect"> 购买引导 </a>';
        $resultStr = sprintf($textTpl, $openid, $toUsername, $time, 'text', $contentStr);
        exit($resultStr);
    }


    /**
     * 生成二维码
     */
    private function create_qrcode($user_id)
    {
        $wxinfo = $this->wx_user;
        $config['token'] = $wxinfo['w_token'];
        $config['appid'] = $wxinfo['appid'];
        $config['appsecret'] = $wxinfo['appsecret'];
        $weObj = new \data\Wechat($config);
        // 获取二维码ticket
        $ticket = $weObj->getQRCode($user_id, 1, 1800);
        if (empty($ticket)) {
            exit;
        }
        // 二维码地址
        $qrcode_url = $weObj->getQRUrl($ticket['ticket']);
        db('users')->where('user_id = ' . $user_id)->update(array('qr'=>$qrcode_url));
    }


    /**
     * 处理点击事件
     * @param type $msg
     */
    private function handleClickEvent($msg)
    {
        $eventKey = $msg['EventKey'];
        $distribut = tpCache('distribut');
        
        //分销二维码图片
        if ($distribut['qrcode_menu_word'] && $eventKey == $distribut['qrcode_menu_word']) {
            $this->replyMyQrcode($msg);
        }
        
        //其他处理
        $this->handleTextMsg($msg);
    }





    
    /**
     * 回复我的二维码
     */
    private function replyMyQrcode($msg)
    {
        $fromUsername = $msg['FromUserName'];
        $toUsername   = $msg['ToUserName'];
        $wechatObj = $this->wechatObj;

        if (!($user = M('users')->where('openid', $fromUsername)->find())) {
            $content = '请进入商城: '.SITE_URL.' , 再获取二维码哦';
            $reply = $wechatObj->createReplyMsgOfText($toUsername, $fromUsername, $content);
            exit($reply);
        }

        //获取缓存的图片id
        $distribut = tpCache('distribut');
        $mediaId = $this->getCacheQrcodeMedia($user['user_id'], $user['head_pic'], $distribut['qr_big_back']);
        if (!$mediaId) {
            $mediaId = $this->createQrcodeMedia($msg, $user['user_id'], $user['head_pic'], $distribut['qr_big_back']);
        }

        //回复图片消息
        $reply = $wechatObj->createReplyMsgOfImage($toUsername, $fromUsername, $mediaId);
        exit($reply);
    }
    
    private function createQrcodeMedia($msg, $userId, $headPic, $qrBackImg)
    {
        $wechatObj = $this->wechatObj;
        
        //创建二维码关注url
        $qrCode = $wechatObj->createTempQrcode(2592000, $userId);
        if (!(is_array($qrCode) && $qrCode['url'])) {
            $this->replyError($msg, '创建二维码失败');
        }

        //创建分销二维码图片
        $shareImg = $this->createShareQrCode('.'.$qrBackImg, $qrCode['url'], $headPic);
        if (!$shareImg) {
            $this->replyError($msg, '生成图片失败');
        }

        //上传二维码图片
        if (!($mediaInfo = $wechatObj->uploadTempMaterial($shareImg, 'image'))) {
            @unlink($shareImg);
            $this->replyError($msg, '上传图片失败');
        }
        @unlink($shareImg);
        
        $this->setCacheQrcodeMedia($userId, $headPic, $qrBackImg, $mediaInfo);
        
        return $mediaInfo['media_id'];
    }
    
    private function getCacheQrcodeMedia($userId, $headPic, $qrBackImg)
    {
        $symbol = md5("{$headPic}:{$qrBackImg}");
        $mediaIdCache = "distributQrCode:{$userId}:{$symbol}";
        $config = cache($mediaIdCache);
        if (!$config) {
            return false;
        }
        
        //$config = json_decode($config);
        //有效期3天（259200s）,提前5小时(18000s)过期
        if (!(is_array($config) && $config['media_id'] && ($config['created_at'] + 259200 - 18000) > time())) {
            return false;
        }

        return $config['media_id'];
    }
    
    private function setCacheQrcodeMedia($userId, $headPic, $qrBackImg, $mediaInfo)
    {
        $symbol = md5("{$headPic}:{$qrBackImg}");
        $mediaIdCache = "distributQrCode:{$userId}:{$symbol}";
        cache($mediaIdCache, $mediaInfo);
    }
    
    /**
     * 处理点击推送事件
     * @param array $msg
     */
    private function handleTextMsg($msg)
    {
        $fromUsername = $msg['FromUserName'];
        $toUsername   = $msg['ToUserName'];
        $keyword      = trim($msg['Content']);

        //点击菜单拉取消息时的事件推送 
        /*
         * 1、click：点击推事件
         * 用户点击click类型按钮后，微信服务器会通过消息接口推送消息类型为event的结构给开发者（参考消息接口指南）
         * 并且带上按钮中开发者填写的key值，开发者可以通过自定义的key值与用户进行交互；
         */
        if ($msg['MsgType'] == 'event' && $msg['Event'] == 'CLICK') {
            $keyword = trim($msg['EventKey']);
        }

        if (empty($keyword)) {
            return false;
        }
        
        //分销二维码图片
        $distribut = tpCache('distribut');
        if ($distribut['qrcode_input_word'] && $distribut['qrcode_input_word'] == $msg['Content']) {
            $this->replyMyQrcode($msg);
        }
        
        // 图文回复
        $wx_img = M('wx_img')->where("keyword", "like", "%$keyword%")->find();
        if( $wx_img) {
            $articles[0] = [
                'title'       => $wx_img['title'],
                'description' => $wx_img['desc'],
                'picurl'      => $wx_img['pic'],
                'url'         => $wx_img['url']
            ];
            $resultStr = $this->wechatObj->createReplyMsgOfNews($toUsername, $fromUsername, $articles);
            exit($resultStr);
        }


        // 文本回复
        $wx_text = M('wx_text')->where("keyword", "like", "%$keyword%")->find();
        if ($wx_text) {
            $resultStr = $this->wechatObj->createReplyMsgOfText($toUsername, $fromUsername, $wx_text['text']);
            exit($resultStr);
        }
    }
    
    /**
     * 默认回复
     * @param type $msg
     */
    private function replyDefault($msg)
    {
        $fromUsername = $msg['FromUserName'];
        $toUsername   = $msg['ToUserName'];
        $content = '欢迎来到TPshop商城 !';
        $resultStr = $this->wechatObj->createReplyMsgOfText($toUsername, $fromUsername, $content);
        exit($resultStr);
    }
    
    private function replyError($msg, $extraMsg = '')
    {
        $fromUsername = $msg['FromUserName'];
        $toUsername   = $msg['ToUserName'];
        $wechatObj = $this->wechatObj;
        
        if ($wechatObj->isDedug()) {
            $content = '错误信息：';
            $content .= $wechatObj->getError() ?: '';
            $content .= $extraMsg ?: '';
        } elseif ($extraMsg) {
            $content = '系统信息：'.$extraMsg;
        } else {
            $content = '系统正在处理...';
        }
        
        $resultStr = $wechatObj->createReplyMsgOfText($toUsername, $fromUsername, $content);
        exit($resultStr);
    }
    
    /**
     * 创建分享二维码图片
     * @param type $backImg 背景大图片
     * @param type $qrText  二维码文本:关注入口
     * @param type $headPic 头像路径
     * @return 图片路径
     */
    private function createShareQrCode($backImg, $qrText, $headPic)
    {
        if (!is_file($backImg) || !$headPic || !$qrText) {
            return false;
        }

        vendor('phpqrcode.phpqrcode');
        vendor('topthink.think-image.src.Image');

        $qr_code_path = './public/upload/qr_code/';
        !file_exists($qr_code_path) && mkdir($qr_code_path, 0777, true);

        /* 生成二维码 */
        $qr_code_file = $qr_code_path.time().rand(1, 10000).'.png';
        \QRcode::png($qrText, $qr_code_file, QR_ECLEVEL_M);

        $QR = Image::open($qr_code_file);
        $QR_width = $QR->width();
        $QR_height = $QR->height();


        /* 添加背景图 */
        if ($backImg && is_file($backImg)) {
            $back =Image::open($backImg);
            $backWidth = $back->width();
            $backHeight = $back->height();

            //生成的图片大小以540*960为准
            if ($backWidth <= $backHeight) {
                $refWidth = 540;
                $refHeight = 960;
                if (($backWidth / $backHeight) > ($refWidth / $refHeight)) {
                    $backRatio = $refWidth / $backWidth;
                    $backWidth = $refWidth;
                    $backHeight = $backHeight * $backRatio;
                } else {
                    $backRatio = $refHeight / $backHeight;
                    $backHeight = $refHeight;
                    $backWidth = $backWidth * $backRatio;
                }
            } else {
                $refWidth = 960;
                $refHeight = 540;
                if (($backWidth / $backHeight) > ($refWidth / $refHeight)) {
                    $backRatio = $refHeight / $backHeight;
                    $backHeight = $refHeight;
                    $backWidth = $backWidth * $backRatio;
                } else {
                    $backRatio = $refWidth / $backWidth;
                    $backWidth = $refWidth;
                    $backHeight = $backHeight * $backRatio;
                }
            }

            $shortSize = $backWidth > $backHeight ? $backHeight : $backWidth;
            $QR_width = $shortSize / 2;
            $QR_height = $QR_width;
            $QR->thumb($QR_width, $QR_height, \think\Image::THUMB_CENTER)->save($qr_code_file, null, 100);
            $back->thumb($backWidth, $backHeight, \think\Image::THUMB_CENTER)
                ->water($qr_code_file, \think\Image::WATER_CENTER, 90)->save($qr_code_file, null, 100);
            $QR = $back;
        }
        

        
        //加上有效时间
        $valid_date = date('Y.m.d', strtotime('+30 days'));
        $QR = $QR->text('有效时间 '.$valid_date, "./vendor/topthink/think-captcha/assets/zhttfs/1.ttf", 16, '#FFFFFF', Image::WATER_SOUTH)->save($qr_code_file);
        
        return $qr_code_file;
    }
}