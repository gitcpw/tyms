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
class Rewrite extends Base{

	protected $rule = array(
		'rule'   => 'require|unique:Rewrite',
		'url'   => 'require'
	);
	protected $message = array(
		'rule.require'   => '规则必须！',
		'rule.unique'   => '规则已存在！',
		'url.require'   => '路由地址标题必须！',
	);

}