<?php
namespace app\admin\controller;
use app\common\controller\Admin;

class Scan extends Admin{
    protected $web_path = '';
    protected $bmt_data = '';
    protected $safe = array(
        'file_type' => 'php|js',
        'code'      => '',
        'func'      => 'com|system|exec|eval|escapeshell|cmd|passthru|base64_decode|gzuncompress',
        'dir'       => '',
        'md5_file'  => ''
    );

    public function _initialize(){
        parent::_initialize(); // TODO: Change the autogenerated stub
        $this->web_path = realpath('../').'/';
        $this->bmt_data = RUNTIME_PATH;
    }

    //木马查杀
    public function index(){
        $this->setMeta("木马查杀");
        $md5_file_list = [];
        if (file_exists($this->bmt_data.'/scan')) {
            $md5_file_list = glob($this->bmt_data.'/scan/md5_*.php');
            if(is_array($md5_file_list)) {
                foreach ($md5_file_list as $k=>$v) {
                    $md5_file_list[$v] = basename($v);
                    unset($md5_file_list[$k]);
                }
            }
        }
        $scan = cache('scan_config');
        if (is_array($scan)) {
            $scan = array_merge($this->safe, $scan);
        } else {
            $scan = $this->safe;
        }
        $scan['dir'] = $this->string2array($scan['dir']);

        $list = glob($this->web_path.'*');
        $this->assign('list',$list);
        $this->assign('scan',$scan);
        $this->assign('md5_file_list',$md5_file_list);
        return $this->fetch('index');
    }

    //1.进行配置文件更新
    public function public_update_config() {
        $data = input('post.');
        $info = isset($data['info']) ? $data['info'] : $this->error('非法动作参数！请返回');
        $dir  = isset($data['dir'])  ? $data['dir'] : '';
        if (empty($dir)) {
            $this->error('请选择需要扫描的文件或目录');
        }
        $info['dir'] = var_export($dir, true);
        cache('scan_config', $info);
        $this->success('1.配置保存成功，开始文件统计...','Scan/public_file_count','',1);
    }

    //2.对要进行扫描的文件进行统计
    public function public_file_count() {
        $scan = cache('scan_config');
        set_time_limit(120);
        $scan['dir'] = $this->string2array($scan['dir']);
        $scan['file_type'] = explode('|', $scan['file_type']);
        $list = array();
        foreach ($scan['dir'] as $v) {
            if (is_dir($v)) {
                foreach ($scan['file_type'] as $k ) {
                    $list = array_merge($list, $this->scan_file_lists($v.DIRECTORY_SEPARATOR, 1, $k, 0, 1, 1));
                }
            } else {
                $list = array_merge($list,
                    array(
                        str_replace($this->web_path, '', $v) => md5_file($v)
                    )
                );
            }
        }
        foreach($list as $k=>$v){
            $new_k = str_replace("\\",'/',$k);
            unset($list[$k]);
            $list[$new_k] = $v;
        }
        cache('scan_list', $list);
        $this->success('2.文件统计完成, 开始文件筛选...','Scan/public_file_filter','',1);
    }

    //3.对文件进行筛选
    public function public_file_filter() {
        $scan_list  = cache('scan_list');
        $scan       = cache('scan_config');
        if (isset($scan['md5_file']) && file_exists($this->bmt_data.'/scan/'.$scan['md5_file'])) {
            $old_md5 = json_decode(file_get_contents($this->bmt_data.'/scan/'.$scan['md5_file']),TRUE);
            foreach ($scan_list as $k=>$v) {
                //文件MD5没有改变的则从扫描列表中提出(不扫描)
                if (isset($old_md5[$k]) && $v == $old_md5[$k]) {
                    unset($scan_list[$k]);
                }
            }
        }
        cache('scan_list', $scan_list);
        $this->success('3.文件筛选完成，进行特征函数过滤...','Scan/public_file_func','',1);
    }

    //4.进行特征函数过滤
    public function public_file_func() {
        @set_time_limit(600);
        $file_list  = cache('scan_list');
        $scan       = cache('scan_config');
        if (isset($scan['func']) && !empty($scan['func'])) {
            foreach ($file_list as $key=>$val) {
                $html = file_get_contents($this->web_path.$key);
                if(stristr($key,'.php.') != false || preg_match_all('/[^a-z]?('.$scan['func'].')\s*\(/i', $html, $state, PREG_SET_ORDER)) {
                    $badfiles[$key]['func'] = $state;
                }
            }
        }
        if(!isset($badfiles)) $badfiles = array();
        cache('scan_bad_file', $badfiles);
        $this->success('4.特征函数过滤完成，进行特征代码过滤...','Scan/public_file_code','',1);
    }

    //5.进行特征代码过滤
    public function public_file_code() {
        @set_time_limit(600);
        $file_list  = cache('scan_list');
        $scan       = cache('scan_config');
        $badfiles   = cache('scan_bad_file');
        if (isset($scan['code']) && !empty($scan['code'])) {
            foreach ($file_list as $key=>$val) {
                $html = file_get_contents($this->web_path.$key);
                if(stristr($key, '.php.') != false || preg_match_all('/[^a-z]?('.$scan['code'].')/i', $html, $state, PREG_SET_ORDER)) {
                    $badfiles[$key]['code'] = $state;
                }
                if(strtolower(substr($key, -4)) == '.php' && function_exists('zend_loader_file_encoded') && zend_loader_file_encoded($this->web_path.$key)) {
                    $badfiles[$key]['zend'] = 'zend encoded';
                }
            }
        }
        cache('scan_bad_file', $badfiles);
        $this->success('5.扫描完成！','Scan/scan_report','',2);
    }

    //扫描报告
    public function scan_report() {
        $this->setMeta("木马查杀报告");
        $badfiles = cache('scan_bad_file');
        if (empty($badfiles)) {
            $this->error('没有找到扫描结果，请重新扫描。','Scan/index');
        }
        $this->assign('badfiles',$badfiles);
        return $this->fetch('report');
    }

    //查看代码
    public function view() {
        $this->setMeta("查看代码");
        $url = input('url','trim');
        $url = isset($url) ? new_stripslashes(base64_decode($url)) : $this->error('非法动作参数！请返回');
        $url = str_replace("..","",$url);

        if (!file_exists($this->web_path.$url)) {
            $this->error('文件不存在！');
        }
        $html = file_get_contents($this->web_path.$url);
        //判断文件名，如果是database.php 对里面的关键字符进行替换
        $basename = basename($url);
        if($basename == "Database.php"){
            $this->error('重要文件，不允许在线查看！');
        }
        $file_list = cache('scan_bad_file');
        if (isset($file_list[$url]['func']) && is_array($file_list[$url]['func']) && !empty($file_list[$url]['func'])) foreach ($file_list[$url]['func'] as $key=>$val)
        {
            $func[$key] = strtolower($val[1]);
        }
        if (isset($file_list[$url]['code']) && is_array($file_list[$url]['code']) && !empty($file_list[$url]['code'])) foreach ($file_list[$url]['code'] as $key=>$val)
        {
            $code[$key] = strtolower($val[1]);
        }
        if (isset($func)) $func = array_unique($func);
        if (isset($code)){
            $code = array_unique($code);
        }else{
            $code = false;
        }

        $this->assign('html',$html);
        $this->assign('code',$code);
        $this->assign('func',$func);
        $this->assign('show_header',true);
        return $this->fetch('view');
    }

    //生成MD5
    public function md5_creat() {
        set_time_limit(120);
        $list = $this->scan_file_lists($this->web_path, 1, 'php', 0, 1);
        if(!file_exists($this->bmt_data)){
            mkdir($this->bmt_data);
        }
        if(!file_exists($this->bmt_data.'/scan')){
            mkdir($this->bmt_data.'/scan');
        }
        file_put_contents($this->bmt_data.'/scan/md5_'.date('Y-m-d').'.php', json_encode($list));
        $this->success('生成完成。','Scan/index');
    }


    /**
     * 将字符串转换为数组
     *
     * @param	string	$data	字符串
     * @return	array	返回数组格式，如果，data为空，则返回空数组
     */
    private function string2array($data) {
        $data = trim($data);
        if($data == '') return array();
        if(strpos($data, 'array')===0){
            @eval("\$array = $data;");
        }else{
            if(strpos($data, '{\\')===0) $data = stripslashes($data);
            $array=json_decode($data,true);
        }
        return $array;
    }

    /*
     * 文件扫描
     * @param $filepath     目录
     * @param $subdir       是否搜索子目录
     * @param $ex           搜索扩展
     * @param $isdir        是否只搜索目录
     * @param $md5			是否生成MD5验证码
     * @param $enforcement  强制更新缓存
     **/
    private function scan_file_lists($filepath, $subdir = 1, $ex = '', $isdir = 0, $md5 = 0, $enforcement = 0)
    {
        static $file_list = array();
        if ($enforcement) $file_list = array();
        $flags = $isdir ? GLOB_ONLYDIR : 0;
        $list = glob($filepath . '*' . (!empty($ex) && empty($subdir) ? '.' . $ex : ''), $flags);
        if (!empty($ex)) $ex_num = strlen($ex);
        foreach ($list as $k => $v) {
            $v1 = str_replace($this->web_path, '', $v);
            if ($subdir && is_dir($v)) {
                $this->scan_file_lists($v .'/', $subdir, $ex, $isdir, $md5);
                continue;
            }
            if (!empty($ex) && strtolower(substr($v, -$ex_num, $ex_num)) == $ex) {
                if ($md5) {
                    $file_list[$v1] = md5_file($v);
                } else {
                    $file_list[] = $v1;
                }
                continue;
            } elseif (!empty($ex) && strtolower(substr($v, -$ex_num, $ex_num)) != $ex) {
                unset($list[$k]);
                continue;
            }
        }
        return $file_list;
    }
}