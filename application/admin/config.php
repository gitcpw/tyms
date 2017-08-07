<?php
// +----------------------------------------------------------------------
// | YizuCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.yizukeji.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: liuxing <464401240@qq.com> <http://www.yizukeji.cn>
// +----------------------------------------------------------------------

return array(

	'user_administrator' => 1,

	//'url_common_param'=>true,

	'template'           => array(
	),

	'view_replace_str'   => array(
		'__ADDONS__' => BASE_PATH . '/addons',
		'__PUBLIC__' => BASE_PATH . '/public',
		'__STATIC__' => BASE_PATH . '/application/admin/static',
		'__IMG__'    => BASE_PATH . '/application/admin/static/img',
		'__CSS__'    => BASE_PATH . '/application/admin/static/css',
		'__JS__'     => BASE_PATH . '/application/admin/static/js',
	),

	'session'            => array(
		'prefix'     => 'admin',
		'type'       => '',
		'auto_start' => true,
	),

    'ORDER_STATUS' => array(
        0 => '未完成',
        1 => '未核销',
        2 => '已核销'
    ),

    'PAY_STATUS' => array(
        0 => '未支付',
        1 => '已支付'
    )


);