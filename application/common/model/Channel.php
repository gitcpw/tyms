<?php
// +----------------------------------------------------------------------
// | YizuCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.yizukeji.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: liuxing <464401240@qq.com> <http://www.yizukeji.cn>
// +----------------------------------------------------------------------

namespace app\common\model;

/**
* 设置模型
*/
class Channel extends Base{

	protected $type = array(
		'id'  => 'integer',
	);

	protected $auto = array('update_time', 'status'=>1);
	protected $insert = array('create_time');
}