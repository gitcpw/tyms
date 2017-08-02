<?php
// 会员模型  会员类型  会员列表

namespace app\common\model;

/**
* 会员模型
*/
class Member extends Base{
    protected $name = "users_type";

    public $users_type_keyList = array(
        array('name'=>'id' ,'title'=>'ID', 'type'=>'hidden'),
        array('name'=>'name' ,'title'=>'会员类型', 'type'=>'text', 'help'=>''),
        array('name'=>'commission' ,'title'=>'固定佣金', 'type'=>'text', 'help'=>''),
        array('name'=>'sort' ,'title'=>'排序', 'type'=>'text', 'help'=>''),
        array('name'=>'backimg' ,'title'=>'背景图', 'type'=>'image', 'help'=>'')
    );

    protected $auto = array('update_time');

    protected $type = array(
        'commission'  => 'integer',
    );

}