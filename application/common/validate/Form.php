<?php
// +----------------------------------------------------------------------
// | YizuCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.yizukeji.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: liuxing <464401240@qq.com> <http://www.yizukeji.cn>
// +----------------------------------------------------------------------

namespace app\common\validate;

/**
 * 设置模型
 */
class Form extends Base {
	protected $rule = array(
		'title'   => 'require',
		'name'   => 'require|unique:form|/^[a-zA-Z]\w{0,39}$/',
	);
	
	protected $message = array(
		'title.require'   => '字段标题不能为空！',
	);
	
	protected $scene = array(
		'add'   => 'title',
		'edit'   => 'title'
	);
}