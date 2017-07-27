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
 * 商品管理类
 * @author liuxing <464401240@qq.com>
 */
class Goods extends \app\common\model\Base {
    protected $name = 'goods_config';

	public $keyList = array(
		array('name'=>'goods_id' ,'title'=>'商品id', 'type'=>'hidden'),
		array('name'=>'goods_name' ,'title'=>'商品名称', 'type'=>'text', 'help'=>''),
		array('name'=>'goods_price' ,'title'=>'商品价格', 'type'=>'num', 'help'=>''),
        array('name'=>'goods_description' ,'title'=>'商品描述', 'type'=>'textarea', 'help'=>''),
		array('name'=>'goods_img' ,'title'=>'商品图片', 'type'=>'image', 'help'=>'')
	);

    protected $auto = array('update_time');

	protected $type = array(
		'goods_img'  => 'integer',
		'goods_price'  => 'integer',
	);
}