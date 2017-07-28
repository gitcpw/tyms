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
* 会员模型
*/
class Member extends Base{
    protected $name = "users_type";

    public $keyList = array(
        array('name'=>'id' ,'title'=>'ID', 'type'=>'hidden'),
        array('name'=>'name' ,'title'=>'会员类型', 'type'=>'text', 'help'=>''),
        array('name'=>'commission' ,'title'=>'固定佣金', 'type'=>'text', 'help'=>''),
        array('name'=>'sort' ,'title'=>'排序', 'type'=>'text', 'help'=>'')
    );

    protected $auto = array('update_time');

    protected $type = array(
        'commission'  => 'integer',
    );

}