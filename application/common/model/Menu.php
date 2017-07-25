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
 * 菜单模型类
 * @author liuxing <464401240@qq.com>
 */
class Menu extends \app\common\model\Base {

	protected $type = array(
		'id'  => 'integer',
	);

	public function getAuthNodes($type = 'admin'){
		$map['type'] = $type;
		$rows = $this->db()->field('id,pid,group,title,url')->where($map)->order('id asc')->select();
		foreach ($rows as $key => $value) {
			$data[$value['id']] = $value;
		}
		foreach ($data as $key => $value) {
			if ($value['pid'] > 0) {
				$value['group'] = $data[$value['pid']]['title'] . '管理';
				$list[] = $value;
			}
		}
		return $list;
	}
}