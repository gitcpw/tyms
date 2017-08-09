<?php
// +----------------------------------------------------------------------
// | YizuCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.yizukeji.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: liuxing <464401240@qq.com> <http://www.yizukeji.cn>
// +----------------------------------------------------------------------

namespace app\common\controller;
use app\index\logic\UsersLogic;

class Fornt extends Base {
    public $session_id;
    public $weixin_config;

    public function _initialize() {
        parent::_initialize();
        //判读是否为关闭网站
        if (\think\Config::get('web_site_close')) {
            header("Content-type:text/html;charset=utf-8");
            echo $this->fetch('common@default/public/close');exit();
        }
        //设置SEO
        $this->setSeo();
        $this->setHoverNav();
        //主题设置
        $this->setThemes();

        //微信浏览器
        if(strstr($_SERVER['HTTP_USER_AGENT'],'MicroMessenger')){
            $user_temp = session('user');
            if (isset($user_temp['user_id']) && $user_temp['user_id']) {
                $user = M('users')->where("user_id", $user_temp['user_id'])->find();
                if (!$user) {
                    session('openid',0);
                    session('user', null);
                }
            }
            if (empty(session('openid'))) {
                $this->weixin_config = M('wx_user')->find(); //获取微信配置
                $this->assign('wechat_config', $this->weixin_config);
                if(is_array($this->weixin_config) && $this->weixin_config['wait_access'] == 1){
                    $wxuser = $this->GetOpenid(); //授权获取openid以及微信用户信息
                    //微信自动登录
                    $logic = new UsersLogic();
                    $data = $logic->thirdLogin($wxuser);

                    if($data['status'] == 1){
                        session('user',$data['result']);
                    }
                }
            }
        }

    }

    //当前栏目导航
    protected function setHoverNav() {
        //dump($_SERVER['PHP_SELF']);
    }

    protected function setThemes() {
        //网站主题设置
        $themes['mobile'] = config('mobile_themes') ? config('mobile_themes') : 'mobile';
        $themes['pc']     = config('pc_themes') ? config('pc_themes') : 'default';
        $view_path        = ($this->isMobile() && config('open_mobile_site') == '1') ? 'template/' . $themes['mobile'] . '/' : 'template/' . $themes['pc'] . '/';
        $module = $this->request->module();
        if (!in_array($module, array('index', 'install'))) {
            $view_path_pre = $module . '/';
        } else {
            $view_path_pre = '';
        }
        $this->view->config('view_path', $view_path . $view_path_pre)
            ->config('tpl_replace_string',array(
                '__IMG__' => BASE_PATH . '/' . $view_path . 'static/img',
                '__JS__'  => BASE_PATH . '/' . $view_path . 'static/js',
                '__CSS__' => BASE_PATH . '/' . $view_path . 'static/css',
            ));
    }

    // 网页授权登录获取 OpendId
    public function GetOpenid()
    {
        $openid = session('openid');
        if($openid)
            return $openid;
        //通过code获得openid
        if (!isset($_GET['code'])){
            //触发微信返回code码
            //$baseUrl = urlencode('http://'.$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'].'?'.$_SERVER['QUERY_STRING']);
            $baseUrl = urlencode($this->get_url());
            $url = $this->__CreateOauthUrlForCode($baseUrl); // 获取 code地址
            Header("Location: $url"); // 跳转到微信授权页面 需要用户确认登录的页面
            exit();
        } else {
            //上面获取到code后这里跳转回来
            $code = input('code');
            $data = $this->getOpenidFromMp($code);//获取网页授权access_token和用户openid
            //if(!isset($data['access_token'])) $this->redirect('index/index/index');
            $data2 = $this->GetUserInfo($data['access_token'],$data['openid']);//获取微信用户信息

            $data['nickname'] = empty($data2['nickname']) ? '微信用户' : trim($data2['nickname']);
            $data['head_pic'] = $data2['headimgurl'];
            session('openid',$data['openid']);
            return $data;
        }
    }

    /**
     * 获取当前的url 地址
     * @return type
     */
    private function get_url() {
        $sys_protocal = isset($_SERVER['SERVER_PORT']) && $_SERVER['SERVER_PORT'] == '443' ? 'https://' : 'http://';
        $php_self = $_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME'];
        $path_info = isset($_SERVER['PATH_INFO']) ? $_SERVER['PATH_INFO'] : '';
        $relate_url = isset($_SERVER['REQUEST_URI']) ? $_SERVER['REQUEST_URI'] : $php_self.(isset($_SERVER['QUERY_STRING']) ? '?'.$_SERVER['QUERY_STRING'] : $path_info);
        return $sys_protocal.(isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : '').$relate_url;
    }

    /**
     *
     * 通过code从工作平台获取openid机器access_token
     * @param string $code 微信跳转回来带上的code
     *
     * @return openid
     */
    public function GetOpenidFromMp($code)
    {
        //通过code获取网页授权access_token 和 openid 。网页授权access_token是一次性的，而基础支持的access_token的是有时间限制的：7200s。
        //1、微信网页授权是通过OAuth2.0机制实现的，在用户授权给公众号后，公众号可以获取到一个网页授权特有的接口调用凭证（网页授权access_token），通过网页授权access_token可以进行授权后接口调用，如获取用户基本信息；
        //2、其他微信接口，需要通过基础支持中的“获取access_token”接口来获取到的普通access_token调用。
        $url = $this->__CreateOauthUrlForOpenid($code);
        $ch = curl_init();//初始化curl
        curl_setopt($ch, CURLOPT_TIMEOUT, 300);//设置超时
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER,FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST,FALSE);
        curl_setopt($ch, CURLOPT_HEADER, FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        $res = curl_exec($ch);//运行curl，结果以jason形式返回
        $data = json_decode($res,true);
        curl_close($ch);
        return $data;
    }


    /**
     *
     * 通过access_token openid 从工作平台获取UserInfo
     * @return openid
     */
    public function GetUserInfo($access_token,$openid)
    {
        // 获取用户 信息
        $url = $this->__CreateOauthUrlForUserinfo($access_token,$openid);
        $ch = curl_init();//初始化curl
        curl_setopt($ch, CURLOPT_TIMEOUT, 300);//设置超时
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER,FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST,FALSE);
        curl_setopt($ch, CURLOPT_HEADER, FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        $res = curl_exec($ch);//运行curl，结果以jason形式返回
        $data = json_decode($res,true);
        curl_close($ch);
        //获取用户是否关注了微信公众号， 再来判断是否提示用户 关注
        if(!isset($data['unionid'])){
            $access_token2 = $this->get_access_token();//获取基础支持的access_token
            $url = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=$access_token2&openid=$openid";
            $subscribe_info = httpRequest($url,'GET');
            $subscribe_info = json_decode($subscribe_info,true);
            $data['subscribe'] = $subscribe_info['subscribe'];
        }
        return $data;
    }


    public function get_access_token(){
        //判断是否过了缓存期
        $expire_time = $this->weixin_config['web_expires'];
        if($expire_time > time()){
            return $this->weixin_config['web_access_token'];
        }
        $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={$this->weixin_config[appid]}&secret={$this->weixin_config[appsecret]}";
        $return = httpRequest($url,'GET');
        $return = json_decode($return,1);
        $web_expires = time() + 7140; // 提前60秒过期
        M('wx_user')->where(array('id'=>$this->weixin_config['id']))->save(array('web_access_token'=>$return['access_token'],'web_expires'=>$web_expires));
        return $return['access_token'];
    }

    /**
     *
     * 构造获取code的url连接
     * @param string $redirectUrl 微信服务器回跳的url，需要url编码
     *
     * @return 返回构造好的url
     */
    private function __CreateOauthUrlForCode($redirectUrl)
    {
        $urlObj["appid"] = $this->weixin_config['appid'];
        $urlObj["redirect_uri"] = "$redirectUrl";
        $urlObj["response_type"] = "code";
//        $urlObj["scope"] = "snsapi_base";
        $urlObj["scope"] = "snsapi_userinfo";
        $urlObj["state"] = "STATE"."#wechat_redirect";
        $bizString = $this->ToUrlParams($urlObj);
        return "https://open.weixin.qq.com/connect/oauth2/authorize?".$bizString;
    }

    /**
     *
     * 构造获取open和access_toke的url地址
     * @param string $code，微信跳转带回的code
     *
     * @return 请求的url
     */
    private function __CreateOauthUrlForOpenid($code)
    {
        $urlObj["appid"] = $this->weixin_config['appid'];
        $urlObj["secret"] = $this->weixin_config['appsecret'];
        $urlObj["code"] = $code;
        $urlObj["grant_type"] = "authorization_code";
        $bizString = $this->ToUrlParams($urlObj);
        return "https://api.weixin.qq.com/sns/oauth2/access_token?".$bizString;
    }

    /**
     *
     * 构造获取拉取用户信息(需scope为 snsapi_userinfo)的url地址
     * @return 请求的url
     */
    private function __CreateOauthUrlForUserinfo($access_token,$openid)
    {
        $urlObj["access_token"] = $access_token;
        $urlObj["openid"] = $openid;
        $urlObj["lang"] = 'zh_CN';
        $bizString = $this->ToUrlParams($urlObj);
        return "https://api.weixin.qq.com/sns/userinfo?".$bizString;
    }

    /**
     *
     * 拼接签名字符串
     * @param array $urlObj
     *
     * @return 返回已经拼接好的字符串
     */
    private function ToUrlParams($urlObj)
    {
        $buff = "";
        foreach ($urlObj as $k => $v)
        {
            if($k != "sign"){
                $buff .= $k . "=" . $v . "&";
            }
        }

        $buff = trim($buff, "&");
        return $buff;
    }
    public function ajaxReturn($data){
        exit(json_encode($data));
    }



    /**
     * 图片文件上传
     * @return array 返回类型
     * @author xing <fbiufo@vip.qq.com>
     */
    protected function upload($file_name = 'image',$ext = 'jpg,png,gif'){
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file($file_name);
        if($file == null) return false;
        // 移动到框架应用根目录/public/uploads/ 目录下
        $info = $file->validate(['size'=>102400000,'ext'=>$ext])->move(ROOT_PATH . 'public' . DS . 'uploads');
        if($info){
            // 成功上传后 获取上传信息
            // 输出 jpg
            //echo $info->getExtension();
            // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
            return 'public/uploads/' . str_replace('\\','/',$info->getSaveName());
            // 输出 42a79759f284b767dfcb2a0197904287.jpg
            //echo $info->getFilename();
        }else{
            // 上传失败获取错误信息
            return $file->getError();
        }
    }


}
