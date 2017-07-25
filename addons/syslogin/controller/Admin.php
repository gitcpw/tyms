<?php
// +----------------------------------------------------------------------
// | YizuCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.yizukeji.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: liuxing <464401240@qq.com> <http://www.yizukeji.cn>
// +----------------------------------------------------------------------

namespace addons\syslogin\controller;
use app\common\controller\Addons;

class Admin extends Addons{
	
    public function setting(){
    	$this->setMeta('第三方登录设置');
		$this->template('admin/login');
    }
}
