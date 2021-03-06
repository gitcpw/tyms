<?php
namespace app\index\controller;
use app\common\controller\Fornt;

/*
 * 微信公众号
 * */
class Weixin extends Fornt {
    public $client;
    public $wechat_config;
    public function _initialize(){
        parent::_initialize();
        //获取微信配置信息
        $this->wechat_config = db('wx_user')->find();
        $options = array(
 			'token'=>$this->wechat_config['w_token'], //填写你设定的key
 			'encodingaeskey'=>$this->wechat_config['aeskey'], //填写加密用的EncodingAESKey
 			'appid'=>$this->wechat_config['appid'], //填写高级调用功能的app id
 			'appsecret'=>$this->wechat_config['appsecret'], //填写高级调用功能的密钥
        );
    }

    public function oauth(){

    }

    public function index(){
        if($this->wechat_config['wait_access'] == 0){
            //等待接入
            if(isset($_GET["echostr"])){
                exit($_GET["echostr"]);
            }else{
                exit('微信公众号当前状态未接入！');
            }
        }else{
            $this->responseMsg();
        }
    }

    /*
     * 微信消息响应
     * */
    public function responseMsg()
    {
        //get post data, May be due to the different environments
        $postStr = $GLOBALS["HTTP_RAW_POST_DATA"];
        if (!$postStr) {
            $postStr = file_get_contents("php://input");
        }
        //extract post data
        if (empty($postStr)){
            exit("");
        }
        /* libxml_disable_entity_loader is to prevent XML eXternal Entity Injection,
           the best way is to check the validity of xml by yourself */
        libxml_disable_entity_loader(true);
        $postObj = simplexml_load_string($postStr, 'SimpleXMLElement', LIBXML_NOCDATA);
        $fromUsername = $postObj->FromUserName;  //用户的openid。
        $toUsername = $postObj->ToUserName;      //商户的公众号原始id。
        $keyword = trim($postObj->Content);      //回复的消息内容（换行：在content中能够换行，微信客户端就支持换行显示）
        $time = time();

        //还未关注过，扫码关注事件  $postObj->EventKey： 为空（扫公众号二维码） 不为空（场景id）
        if($postObj->Event == 'subscribe'){
            //公司员工关注公司公众号二维码
            if(empty($postObj->EventKey)){
                $textTpl = "<xml>
                        <ToUserName><![CDATA[%s]]></ToUserName>
                        <FromUserName><![CDATA[%s]]></FromUserName>
                        <CreateTime>%s</CreateTime>
                        <MsgType><![CDATA[%s]]></MsgType>
                        <Content><![CDATA[%s]]></Content>
                        <FuncFlag>0</FuncFlag>
                        </xml>";
                $contentStr = ' 尊敬的顾客您好，'."\n".'请点击信息结尾的“购买引导”，进入购买引导界面123123123'."\n".'<a href="http://www.baidu.com"> 购买引导 </a>';
                $resultStr = sprintf($textTpl, $fromUsername, $toUsername, $time, 'text', $contentStr);
                exit($resultStr);
            }
        }
        //已关注，扫码后的事件
        if($postObj->Event == 'SCAN'){
            //公司员工关注公司公众号二维码
            if(!isset($postObj->EventKey)){
                $textTpl = "<xml>
                        <ToUserName><![CDATA[%s]]></ToUserName>
                        <FromUserName><![CDATA[%s]]></FromUserName>
                        <CreateTime>%s</CreateTime>
                        <MsgType><![CDATA[%s]]></MsgType>
                        <Content><![CDATA[%s]]></Content>
                        <FuncFlag>0</FuncFlag>
                        </xml>";
                $contentStr = ' 尊敬的顾客您好，'."\n".'请点击信息结尾的“购买引导”，进入购买引导界面789'."$userinfo\n".'<a href="http://www.baidu.com"> 购买引导 </a>';
                $resultStr = sprintf($textTpl, $fromUsername, $toUsername, $time, 'text', $contentStr);
                exit($resultStr);
            }
        }

        //取消关注
        if($postObj->Event == 'unsubscribe'){
            //解除用户绑定
            exit;
        }

        //上报地理位置，扫码，点击菜单
        //请查看微信文档 https://mp.weixin.qq.com/wiki


        //点击菜单拉取消息时的事件推送
        /*
         * 1、click：点击推事件
         * 用户点击click类型按钮后，微信服务器会通过消息接口推送消息类型为event的结构给开发者（参考消息接口指南）
         * 并且带上按钮中开发者填写的key值，开发者可以通过自定义的key值与用户进行交互；
         */
        if($postObj->MsgType == 'event' && $postObj->Event == 'CLICK') {
            $keyword = trim($postObj->EventKey);
        }

        if(empty($keyword)){
            exit("Input something...");
        }

        /************************转接到客服系统************************/
        if('在线客服' == $keyword){
            $textTpl = "<xml>
                         <ToUserName><![CDATA[%s]]></ToUserName>
                         <FromUserName><![CDATA[%s]]></FromUserName>
                         <CreateTime>%s</CreateTime>
                         <MsgType><![CDATA[transfer_customer_service]]></MsgType>
                    </xml>";
            $resultStr = sprintf($textTpl, $fromUsername, $toUsername, $time);
            exit($resultStr);
        }
        /************************转接到客服系统************************/

        $wx_accurate = config('wx_accurate');
        if(!$wx_accurate){
            $whe['keyword'] = array('like',"%$keyword%");     //模糊查询
        }else{
            $whe['keyword'] = $keyword;                       //精准查询
        }
        $type = db('wx_keyword')->where($whe)->value('type'); //查询关键词类型

        $wx_content = '';
        if($type){
            $tables = array(
                'IMG'=> 'wx_img',
                'TEXT'=> 'wx_text',
                'material'=> 'wx_material'
            );
            $wx_content = db($tables[$type])->where($whe)->find();
        }

        if(!$wx_content){
            // 其他文本回复
            $textTpl = "<xml>
                    <ToUserName><![CDATA[%s]]></ToUserName>
                    <FromUserName><![CDATA[%s]]></FromUserName>
                    <CreateTime>%s</CreateTime>
                    <MsgType><![CDATA[%s]]></MsgType>
                    <Content><![CDATA[%s]]></Content>
                    <FuncFlag>0</FuncFlag>
                    </xml>";
            $contentStr = config('auto_reply');
            $resultStr = sprintf($textTpl, $fromUsername, $toUsername, $time, 'text', $contentStr);
            exit($resultStr);
        }


        if('IMG' == $type){
            // 图文回复
            $textTpl = "<xml>
                    <ToUserName><![CDATA[%s]]></ToUserName>
                    <FromUserName><![CDATA[%s]]></FromUserName>
                    <CreateTime>%s</CreateTime>
                    <MsgType><![CDATA[%s]]></MsgType>
                    <ArticleCount><![CDATA[%s]]></ArticleCount>
                    <Articles>
                        <item>
                            <Title><![CDATA[%s]]></Title> 
                            <Description><![CDATA[%s]]></Description>
                            <PicUrl><![CDATA[%s]]></PicUrl>
                            <Url><![CDATA[%s]]></Url>
                        </item>                               
                    </Articles>
                    </xml>";
            $resultStr = sprintf($textTpl,$fromUsername,$toUsername,$time,'news','1',$wx_content['title'],$wx_content['desc']
                , WEB_PATH.'/public/'.$wx_content['pic'], $wx_content['url']);
            exit($resultStr);

        }elseif('TEXT' == $type){
            // 文本回复
            $textTpl = "<xml>
                    <ToUserName><![CDATA[%s]]></ToUserName>
                    <FromUserName><![CDATA[%s]]></FromUserName>
                    <CreateTime>%s</CreateTime>
                    <MsgType><![CDATA[%s]]></MsgType>
                    <Content><![CDATA[%s]]></Content>
                    <FuncFlag>0</FuncFlag>
                    </xml>";
            $contentStr = $wx_content['text'];
            $resultStr = sprintf($textTpl, $fromUsername, $toUsername, $time, 'text', $contentStr);
            exit($resultStr);

        }elseif('material' == $type) {
            // 图片回复
            $textTpl = "<xml>
                    <ToUserName><![CDATA[%s]]></ToUserName>
                    <FromUserName><![CDATA[%s]]></FromUserName>
                    <CreateTime>%s</CreateTime>
                    <MsgType><![CDATA[%s]]></MsgType>
                    <Image>
                    <MediaId><![CDATA[%s]]></MediaId>
                    </Image>
                    </xml>";
            $contentStr = $wx_content['media_id'];
            $resultStr = sprintf($textTpl, $fromUsername, $toUsername, $time, 'image', $contentStr);
            exit($resultStr);
        }
    }



    /**
     * 如果access_token过期则重新获取，如果没有就返回数据库的access_token
     * @param $appid
     * @param $appsecret
     * @return mixed
     */
    public function get_access_token($appid,$appsecret){
        //判断是否过了缓存期
        $wechat = db('wx_user')->find();
        $expire_time = $wechat['web_expires'];
        if($expire_time > time()){
            return $wechat['web_access_token'];
        }
        $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={$appid}&secret={$appsecret}";
        $return = httpRequest($url,'GET');
        $return = json_decode($return,1);
        $web_expires = time() + 7000; // 提前200秒过期
        db('wx_user')->where(array('id'=>$wechat['id']))->update(array('web_access_token'=>$return['access_token'],'web_expires'=>$web_expires));
        return $return['access_token'];
    }

}