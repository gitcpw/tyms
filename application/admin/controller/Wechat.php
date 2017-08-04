<?php
namespace app\admin\controller;
use app\common\controller\Admin;
use think\Db;
use think\Loader;

class Wechat extends Admin {
    /*
     * 公众号列表
     * */
    public function index(){
        $wechat_list = db('wx_user')->select();
        $this->assign('lists',$wechat_list);
        $this->setMeta("公众号设置");
        return $this->fetch();
    }

    /*
     * 设置公众号
     * */
    public function setting(){
        $id = input('id/d');
        $wechat = db('wx_user')->where(array('id'=>$id))->find();
        if(!$wechat){
            $this->error("公众号不存在");
            exit;
        }
        if($this->request->isPost()){
            $post_data = input('post.');
            //头像上传
            $file = $this->upload('headerpic');
            if($file && !file_exists($file)){
                $this->error($file);
            }
            if(file_exists($file)){
                $post_data['headerpic'] = $file;
                file_exists($wechat['headerpic']) && unlink($wechat['headerpic']);
            }

            //二维码上传
            $file = $this->upload('qr');
            if($file && !file_exists($file)){
                $this->error($file);
            }
            if(file_exists($file)){
                $post_data['qr'] = $file;
                file_exists($wechat['qr']) && unlink($wechat['qr']);
            }

            $row = db('wx_user')->where(array('id'=>$id))->update($post_data);
            $row && exit($this->success("修改成功"));
            exit($this->error("修改失败"));
        }
        $apiurl = url('Index/Weixin/index');

        $this->assign('wechat',$wechat);
        $this->assign('apiurl',$apiurl);
        return $this->fetch();
    }

    /*
     * 菜单列表
     * */
    public function menu(){
        $list = db('wx_menu')->order('sort ASC')->select();
        $list = \data\Data::tree($list,'name','id','pid');
        $this->assign('list',$list);
        $typeArr = ['view'=>'链接','click'=>'触发关键字','scancode_push'=>'扫码','scancode_waitmsg'=>'扫码（等待信息）','pic_sysphoto'=>'系统拍照发图','pic_photo_or_album'=>'拍照或者相册发图','pic_weixin'=>'微信相册发图','location_select'=>'地理位置'];
        $this->assign('typeArr',$typeArr);
        $this->setMeta("微信菜单");
        return $this->fetch();
    }

    /*
     * 新增菜单
     * */
    public function add_menu(){
        if($this->request->isPost()){
            $post_menu = input('post.');
            //判断菜单数量
            if(!isset($post_menu['id'])){
                if($post_menu['pid'] == 0){
                    $num = db('wx_menu')->where(['pid'=>$post_menu['pid']])->count();
                    $num > 2 && $this->error('最多三个一级菜单');
                }else{
                    $num = db('wx_menu')->where(['id'=>$post_menu['pid']])->count();
                    $num > 5 && $this->error('一级菜单下最多5个二级菜单');
                }
            }


            $wechat = db('wx_user')->find();
            $post_menu['token'] = $wechat['token'];
            $post_menu['level'] = $post_menu['pid'] ? 2 : 1;
            //插入
            db('wx_menu')->insert($post_menu);
            $this->success('操作成功,发布后生效!','menu','p');
            exit;
        }
        $parents = db('wx_menu')->where('pid','=','0')->order('sort ASC')->select();
        $typeArr = ['view'=>'链接','click'=>'触发关键字','scancode_push'=>'扫码','scancode_waitmsg'=>'扫码（等待信息）','pic_sysphoto'=>'系统拍照发图','pic_photo_or_album'=>'拍照或者相册发图','pic_weixin'=>'微信相册发图','location_select'=>'地理位置'];
        $this->assign('parents',$parents);
        $this->assign('typeArr',$typeArr);
        $this->assign('suburl',url('add_menu'));
        return $this->fetch('menu_form');
    }

    /*
     * 新增菜单
     * */
    public function edit_menu(){
        if($this->request->isPost()){
            $post_menu = input('post.');
            //判断菜单数量
            if(!isset($post_menu['id'])){
                if($post_menu['pid'] == 0){
                    $num = db('wx_menu')->where(['pid'=>$post_menu['pid']])->count();
                    $num > 2 && $this->error('最多三个一级菜单');
                }else{
                    $num = db('wx_menu')->where(['id'=>$post_menu['pid']])->count();
                    $num > 5 && $this->error('一级菜单下最多5个二级菜单');
                }
            }

            $wechat = db('wx_user')->find();
            $post_menu['token'] = $wechat['token'];
            $post_menu['level'] = $post_menu['pid'] ? 2 : 1;
            //插入
            db('wx_menu')->where(['id'=>$post_menu['id']])->update($post_menu);
            $this->success('操作成功,发布后生效!','menu','p');
            exit;
        }

        $id = input('id/d');
        if(!$id) $this->error('参数错误','menu','p');
        $info = db('wx_menu')->where('id',$id)->find();
        if(!$info) $this->error('查无数据','menu','p');
        $this->assign('info',$info);

        $parents = db('wx_menu')->where('pid','=','0')->where('id','<>',$id)->order('sort ASC')->select();
        $typeArr = ['view'=>'链接','click'=>'触发关键字','scancode_push'=>'扫码','scancode_waitmsg'=>'扫码（等待信息）','pic_sysphoto'=>'系统拍照发图','pic_photo_or_album'=>'拍照或者相册发图','pic_weixin'=>'微信相册发图','location_select'=>'地理位置'];
        $this->assign('parents',$parents);
        $this->assign('typeArr',$typeArr);
        $this->assign('suburl',url('edit_menu'));
        return $this->fetch('menu_form');
    }


    /*
     * 删除菜单
     */
    public function del_menu(){
        $id = input('id/d');
        if(!$id){
            $this->error('参数错误!');
        }
        $row = db('wx_menu')->where(array('id'=>$id))->delete();
        $row && db('wx_menu')->where(array('pid'=>$id))->delete(); //删除子类
        if($row){
            $this->success('删除成功,发布后生效!');
        }else{
            $this->error('删除失败!');
        }
    }

    /*
     * 生成微信菜单
     */
    public function pub_menu(){
        //获取菜单
        $wechat = db('wx_user')->find();
        //获取父级菜单
        $p_menus = db('wx_menu')->where(array('token'=>$wechat['token'],'pid'=>0))->order('sort ASC')->select();
        $p_menus = convert_arr_key($p_menus,'id');

        $post_str = $this->convert_menu($p_menus,$wechat['token']);
        // http post请求
        if(!count($p_menus) > 0){
            $this->error('没有菜单可发布',url('Wechat/menu'));
            exit;
        }
        $access_token = $this->get_access_token($wechat['appid'],$wechat['appsecret']);
        if(!$access_token){
            $this->error('获取access_token失败',url('Wechat/menu')); //  http://www.tpshop.com/index.php/Admin/Wechat/menu
            exit;
        }
        $url = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token={$access_token}";
        //show_bug($post_str);
        $return = httpRequest($url,'POST',$post_str);
        $return = json_decode($return,1);
        if($return['errcode'] == 0){
            $this->success('菜单已成功生成',url('Wechat/menu'));
        }else{
            $this->error("发布失败,错误代码;".$return['errcode']);
            exit;
        }
    }

    //菜单转换
    private function convert_menu($p_menus,$token){
        $key_map = array(
            'scancode_waitmsg'=>'rselfmenu_0_0',
            'scancode_push'=>'rselfmenu_0_1',
            'pic_sysphoto'=>'rselfmenu_1_0',
            'pic_photo_or_album'=>'rselfmenu_1_1',
            'pic_weixin'=>'rselfmenu_1_2',
            'location_select'=>'rselfmenu_2_0',
        );
        $new_arr = array();
        $count = 0;
        foreach($p_menus as $k => $v){
            $new_arr[$count]['name'] = $v['name'];

            //获取子菜单
            $c_menus = db('wx_menu')->where(array('token'=>$token,'pid'=>$k))->select();

            if($c_menus){
                foreach($c_menus as $kk=>$vv){
                    $add = array();
                    $add['name'] = $vv['name'];
                    $add['type'] = $vv['type'];
                    // click类型
                    if($add['type'] == 'click'){
                        $add['key'] = $vv['value'];
                    }elseif($add['type'] == 'view'){
                        $add['url'] = $vv['value'];
                    }else{
                        //$add['key'] = $key_map[$add['type']];
                        $add['key'] = $vv['value'];       //2016年9月29日01:28:37  QQ  海南大卫照明  367013672  提供
                    }
                    $add['sub_button'] = array();
                    if($add['name']){
                        $new_arr[$count]['sub_button'][] = $add;
                    }
                }
            }else{
                $new_arr[$count]['type'] = $v['type'];
                // click类型
                if($new_arr[$count]['type'] == 'click'){
                    $new_arr[$count]['key'] = $v['value'];
                }elseif($new_arr[$count]['type'] == 'view'){
                    //跳转URL类型
                    $new_arr[$count]['url'] = $v['value'];
                }else{
                    //其他事件类型
                    //$new_arr[$count]['key'] = $key_map[$v['type']];
                    $new_arr[$count]['key'] = $v['value'];  //2016年9月29日01:40:13
                }
            }
            $count++;
        }
        // return json_encode(array('button'=>$new_arr));
        return json_encode(array('button'=>$new_arr),JSON_UNESCAPED_UNICODE);
    }

    /*
     * 文本回复
     */
    public function text(){
        $wechat = db('wx_user')->find();
        $pre = config('database.prefix');
        $sql = "SELECT k.id,k.keyword,t.text FROM {$pre}wx_keyword k LEFT JOIN {$pre}wx_text AS t ON t.id = k.pid WHERE k.token = '{$wechat['token']}' AND type = 'TEXT' ORDER BY t.createtime DESC";
        $lists = DB::query($sql);
        $this->assign('lists',$lists);
        $this->setMeta("文本回复");
        return $this->fetch();
    }

    /*
     * 添加文本回复
     */
    public function add_text(){
        $wechat = db('wx_user')->find();
        if($this->request->isPost()){
            $edit = input('edit');
            $add['keyword'] =  input('post.keyword');
            $add['token'] =  $wechat['token'];
            $add['text'] = input('post.text');
            if(!$edit){
                //添加模式
                $add['createtime'] = time();
                $add['pid'] = DB::name('wx_text')->insertGetId($add);
                unset($add['text']);
                unset($add['createtime']);
                $add['type'] = 'TEXT';
                $row = db('wx_keyword')->insert($add);
            }else{
                //编辑模式
                $id = input('post.kid');
                $model = db('wx_keyword')->where(array('id'=>$id));
                $data = $model->find();
                if($data){
                    $update = input('post.');
                    $update['type'] = 'TEXT';
                    unset($update['text']);
                    unset($update['kid']);
                    db('wx_keyword')->where(array('id'=>$id))->update($update);
                    $row = db('wx_text')->where(array('id'=>$data['pid']))->update($add);
                }
            }
            $row ? $this->success("操作成功",url('Admin/Wechat/text'),'p') : $this->error("操作失败",url('Admin/Wechat/text'),'p');
            exit;
        }

        $id = input('id/d');
        if($id){
            $sql = "SELECT k.id,k.keyword,t.text FROM ".PREFIX."wx_keyword k LEFT JOIN ".PREFIX."wx_text AS t ON t.id = k.pid WHERE k.token = '{$wechat['token']}' AND k.id = {$id} AND k.type = 'TEXT'";
            $data = DB::query($sql);
            $this->assign('keyword',$data[0]);
        }
        return $this->fetch();
    }

    /*
     * 删除文本回复
     */
    public function del_text(){
        $id = input('id/d');
        $row = db('wx_keyword')->where(array('id'=>$id))->find();
        if($row){
            db('wx_keyword')->where(array('id'=>$id))->delete();
            db('wx_text')->where(array('id'=>$row['pid']))->delete();
            $this->success("删除成功");
        }else{
            $this->error("删除失败");
        }
    }
    /*
     * 图文列表
     */
    public function img(){
        $wechat = db('wx_user')->find();
        $pre = config('database.prefix');
        $sql = "SELECT k.id,k.keyword,i.title,i.url,i.pic,i.desc FROM {$pre}wx_keyword k LEFT JOIN {$pre}wx_img i ON i.id = k.pid WHERE k.token = '{$wechat['token']}' AND type = 'IMG' ORDER BY i.createtime DESC ";
        $lists = DB::query($sql);
        $this->assign('lists',$lists);
        $this->setMeta("图文回复");
        return $this->fetch();
    }
    /*
     * 添加图文回复
     */
    public function add_img(){
        $wechat = db('wx_user')->find();
        if($this->request->isPost()){
            $keyword_add['keyword'] = $add['keyword'] =  input('post.keyword');
            $keyword_add['token'] = $add['token'] =  $wechat['token'];
            $add['title'] = input('post.title');
            $add['desc'] = input('post.desc');
            $add['pic'] = input('post.pic');

            //封面图片
            $file = $this->upload('pic');
            if($file && !file_exists($file)){
                $this->error($file);
            }
            if(file_exists($file)){
                $add['pic'] && file_exists($add['pic']) && unlink($add['pic']);
                $add['pic'] = $file;
            }

            $add['url'] = input('post.url');  // 商品地址 或 其他
            $add['goods_id'] = input('post.goods_id');
            $add['goods_name'] = input('post.goods_name'); //商品名字
            $keyword_add['type'] = 'IMG';

            empty($add['keyword']) && $this->error("关键词不得为空");
            empty($add['title'])   && $this->error("标题不得为空");
            empty($add['url'])     && $this->error("url不得为空");
            empty($add['pic'])     && $this->error("封面图片不得为空");
            empty($add['desc'])    && $this->error("简介不得为空");

            $edit = input('edit');
            if(!$edit){
                //添加模式
                $add['createtime'] = time();
                $wx_img_last_ins_id =  DB::name('wx_img')->insertGetId($add);
                $keyword_add['pid'] = $wx_img_last_ins_id;
                $row = db('wx_keyword')->insert($keyword_add);
            }else{
                //编辑模式
                $id = input('post.kid');
                $model = db('wx_keyword')->where(array('id'=>$id,'type'=>'IMG'));
                $data = $model->find();
                if($data){
                    db('wx_keyword')->where(array('id'=>$id))->update($keyword_add);
                    $add['uptatetime'] = time();
                    $row = db('wx_img')->where(array('id'=>$data['pid']))->update($add);
                }
            }
            $row ? $this->success("操作成功",url('Admin/Wechat/img'),'p') : $this->error("操作失败",url('Admin/Wechat/img'),'p');
            exit;
        }

        $id = input('id/d');
        if($id){
            $pre = config('database.prefix');
            $sql = "SELECT k.id,k.keyword,i.title,i.url,i.pic,i.desc FROM {$pre}wx_keyword k LEFT JOIN {$pre}wx_img i ON i.id = k.pid WHERE k.token = '{$wechat['token']}' AND type = 'IMG' AND k.id = {$id}";
            $data = DB::query($sql);
            $this->assign('keyword',$data[0]);
        }
        return $this->fetch();
    }

    /*
     * 删除图文回复
     */
    public function del_img(){
        $id = input('id/d');
        $row = db('wx_keyword')->where(array('id'=>$id))->find();
        if($row){
            db('wx_keyword')->where(array('id'=>$id))->delete();
            $pic = db('wx_img')->where(array('id'=>$row['pid']))->value('pic');
            file_exists($pic) && unlink($pic);
            db('wx_img')->where(array('id'=>$row['pid']))->delete();
            $this->success("删除成功");
        }else{
            $this->error("删除失败");
        }
    }

    /*************************************************************************************/
    /*
     * 图文列表
     */
    public function material(){
        $wechat = db('wx_user')->find();
        $pre = config('database.prefix');
        $sql = "SELECT k.id,k.keyword,i.pic,i.media_id,i.wx_url FROM {$pre}wx_keyword k LEFT JOIN {$pre}wx_material i ON i.id = k.pid WHERE k.token = '{$wechat['token']}' AND type = 'material' ORDER BY i.createtime DESC ";
        $lists = DB::query($sql);
        $this->assign('lists',$lists);
        $this->setMeta("图片回复");
        return $this->fetch();
    }
    /*
     * 添加图文回复
     */
    public function add_material(){
        $wechat = db('wx_user')->find();
        if($this->request->isPost()){
            $keyword_add['keyword'] = $add['keyword'] =  input('post.keyword');
            $keyword_add['token']   = $add['token']   =  $wechat['token'];
            $add['pic'] = input('post.pic');
            $add['media_id'] = input('post.media_id');

            //封面图片
            $file = $this->upload('pic');
            if($file && !file_exists($file)){
                $this->error($file);
            }
            if(file_exists($file)){
                $add['pic'] && file_exists($add['pic']) && unlink($add['pic']);
                $add['pic'] = $file;
                $add['media_id'] = '';
            }
            $keyword_add['type'] = 'material';

            empty($add['keyword']) && $this->error("关键词不得为空");
            empty($add['pic'])     && $this->error("图片不得为空");

            if(!$add['media_id']){
                $result = $this->update_material($add['pic']);
                $add['media_id'] = !empty($result['media_id']) ? $result['media_id'] : '';
                $add['wx_url']   = !empty($result['url']) ? $result['url'] : '';
            }
            empty($add['media_id']) && unlink($add['pic']) && $this->error("上传素材失败");

            $edit = input('edit');
            if(!$edit){
                //添加模式
                $add['createtime'] = time();
                $wx_img_last_ins_id =  DB::name('wx_material')->insertGetId($add);
                $keyword_add['pid'] = $wx_img_last_ins_id;
                $row = db('wx_keyword')->insert($keyword_add);
            }else{
                //编辑模式
                $id = input('post.kid');
                $model = db('wx_keyword')->where(array('id'=>$id,'type'=>'material'));
                $data = $model->find();
                if($data){
                    db('wx_keyword')->where(array('id'=>$id))->update($keyword_add);
                    $row = db('wx_material')->where(array('id'=>$data['pid']))->update($add);
                }
            }
            $row ? $this->success("操作成功",url('Admin/Wechat/material'),'p') : $this->error("操作失败",url('Admin/Wechat/material'),'p');
            exit;
        }

        $id = input('id/d');
        if($id){
            $pre = config('database.prefix');
            $sql = "SELECT k.id,k.keyword,i.pic,i.media_id FROM {$pre}wx_keyword k LEFT JOIN {$pre}wx_material i ON i.id = k.pid WHERE k.token = '{$wechat['token']}' AND type = 'material' AND k.id = {$id}";
            $data = DB::query($sql);
            $this->assign('keyword',$data[0]);
        }
        return $this->fetch();
    }

    /*
     * 删除图片素材
     */
    public function del_material(){
        $id = input('id/d');
        $row = db('wx_keyword')->where(array('id'=>$id))->find();
        if($row){
            db('wx_keyword')->where(array('id'=>$id))->delete();
            $pic = db('wx_material')->where(array('id'=>$row['pic']))->value('pic');
            file_exists($pic) && unlink($pic);
            db('wx_material')->where(array('id'=>$row['pid']))->delete();
            $this->success("删除成功");
        }else{
            $this->error("删除失败");
        }
    }

    /************************************************************/

    /*
     * 上传图片素材
     * */
    private function update_material($file){
        $wechat = db('wx_user')->find();
        $access_token = $this->get_access_token($wechat['appid'],$wechat['appsecret']);//获取基础支持的access_token

        if(!$access_token){
            $this->error('获取access_token失败',url('Wechat/material')); //  http://www.tpshop.com/index.php/Admin/Wechat/menu
            exit;
        }

        $url="https://api.weixin.qq.com/cgi-bin/material/add_material?access_token={$access_token}&type=image";
        $ch1 = curl_init();
        $timeout = 10;
        $real_path=realpath($file);
        $cfile = curl_file_create($real_path);   //use the CURLFile Class 替换@的使用方法。
        $data= array("media"=>$cfile);
        curl_setopt ( $ch1, CURLOPT_URL, $url );
        curl_setopt ( $ch1, CURLOPT_POST, 1 );
        curl_setopt ( $ch1, CURLOPT_RETURNTRANSFER, 1 );
        curl_setopt ( $ch1, CURLOPT_CONNECTTIMEOUT, $timeout );
        curl_setopt ( $ch1, CURLOPT_SSL_VERIFYPEER, FALSE );
        curl_setopt ( $ch1, CURLOPT_SSL_VERIFYHOST, false );
        curl_setopt ( $ch1, CURLOPT_POSTFIELDS, $data);
        $result = curl_exec ( $ch1 );
        $errno = curl_errno($ch1);
        curl_close ( $ch1 );
        if($errno==0){
            $result = json_decode($result,true);
            return $result;
        }else{
            return false;
        }
    }

    /*
     * 多图文消息列表
     */
    public function news(){
        $wechat = db('wx_user')->find();
        $pre = config('database.prefix');
        $sql = "SELECT k.id,k.keyword,k.pid,i.img_id FROM {$pre}wx_keyword k LEFT JOIN {$pre}wx_news i ON i.id = k.pid WHERE k.token = '{$wechat['token']}' AND type = 'NEWS' ORDER BY i.createtime DESC";
        $lists = DB::query($sql);
        $this->assign('lists',$lists);
        return $this->fetch();
    }


    /**
     * 分享信息
     * @param $appid
     * @param $appsecret
     * @return mixed
     *
     */
    public function shareinfo(){
        //公司分享原链接
        /*$wechat_list = db('wx_user')->select();
        $appid = $wechat_list[0]['appid'];//appid
        $redirect_uri = "http://tianyimeishan.yizukeji.cn";//回调地址
        $scope = "snsapi_userinfo";//scope类型  snsapi_base （不弹出授权页面，直接跳转，只能获取用户openid） snsapi_userinfo （弹出授权页面，可通过openid拿到昵称、性别、所在地。并且，即使在未关注的情况下，只要用户授权，也能获取其信息）
        $state = "1";//重定向后会带上state参数
        $url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=".$appid."&redirect_uri=".$redirect_uri."&response_type=code&scope=".$scope."&state=".$state."#wechat_redirect";

        return $url;*/
        $wechat = db('wx_user')->find();
        $access_token = $this->get_access_token($wechat['appid'],$wechat['appsecret']);//获取基础支持的access_token
        $url = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=$access_token";
        $qrcode = '{"action_name":"QR_LIMIT_SCENE","action_info":{"scene":{"scene_id":1}}}';
        $result = httpRequest($url,'POST',$qrcode);
        $jsoninfo = json_decode($result,true);
        $ticket = $jsoninfo['ticket'];
        if($ticket){
            $url = "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=$ticket";
            $this->redirect($url);
        }else{
            $this->error('错误！');
        }
        /*$extends = & $this->load_wechat('Extends');
        $result = $extends->getShortUrl($url);
        print_r($result);
        exit;*/

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


    /**
     * 获取微信操作对象（单例模式）
     * @staticvar array $wechat 静态对象缓存对象
     * @param type $type 接口名称 ( Card|Custom|Device|Extend|Media|Oauth|Pay|Receive|Script|User )
     * @return \Wehcat\WechatReceive 返回接口对接
     */
    /*function & load_wechat($type = '') {
        static $wechat = array();
        $index = md5(strtolower($type));
        if (!isset($wechat[$index])) {
            $wechat = db('wx_user')->find();
            // 定义微信公众号配置参数（这里是可以从数据库读取的哦）
            $options = array(
                'token'           => $wechat['token'], // 填写你设定的key
                'appid'           => $wechat['appid'], // 填写高级调用功能的app id, 请在微信开发模式后台查询
                'appsecret'       => $wechat['appsecret'], // 填写高级调用功能的密钥
                'encodingaeskey'  => '', // 填写加密用的EncodingAESKey（可选，接口传输选择加密时必需）
                'mch_id'          => '', // 微信支付，商户ID（可选）
                'partnerkey'      => '', // 微信支付，密钥（可选）
                'ssl_cer'         => '', // 微信支付，双向证书（可选，操作退款或打款时必需）
                'ssl_key'         => '', // 微信支付，双向证书（可选，操作退款或打款时必需）
                'cachepath'       => '', // 设置SDK缓存目录（可选，默认位置在Wechat/Cache下，请保证写权限）
            );
            \Wechat\Loader::config($options);
            $wechat[$index] = \Wechat\Loader::get($type);
        }
        return $wechat[$index];
    }*/



}