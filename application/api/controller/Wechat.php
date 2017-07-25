<?php
// +----------------------------------------------------------------------
// | YizuCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.yizukeji.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: liuxing <464401240@qq.com> <http://www.yizukeji.cn>
// +----------------------------------------------------------------------

namespace app\api\controller;
use app\common\controller\Api;

class Wechat extends Api {

	public function config(){
		$js = new \Wechat\WechatScript(config('wxapp'));
		$this->data['data'] = $js->getJsSign('http://test.YizuCMS.cn:81/home');
// dump($this->data);
// 		$this->data['data'] = array(
// 			'appid'  => 'dddd',
// 			'timestamp' => time()
// 		);
		return $this->data;
	}
}