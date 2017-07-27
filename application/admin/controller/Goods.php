<?php
// +----------------------------------------------------------------------
// | YizuCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.yizukeji.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: liuxing <464401240@qq.com> <http://www.yizukeji.cn>
// +----------------------------------------------------------------------

namespace app\admin\controller;
use app\common\controller\Admin;

class Goods extends Admin {

	public function index() {
        $info = db('goods_config')->find();
        //如果商品表存在数据则修改商品
        if(!empty($info)){
            $goods = model('goods');
            if (IS_POST) {
                $data = input('post.');
                if ($data) {
                    $result = $goods->save($data, array('goods_id' => $data['goods_id']));
                    if ($result) {
                        return $this->success("修改成功！", url('Goods/index'));
                    } else {
                        return $this->error("修改失败！");
                    }
                } else {
                    return $this->error($goods->getError());
                }
            } else {
                $data = array(
                    'keyList' => $goods->keyList,
                    'info'    => $info,
                );
                $this->assign($data);
                $this->setMeta("产品管理");
                return $this->fetch('public/edit');
            }
        //如果商品表没有数据则添加商品数据
        }else{
            $goods = model('goods');
            if (IS_POST) {
                $data = input('post.');
                if ($data) {
                    $data['goods_id'] = 1;
                    $result = $goods->save($data);
                    if ($result) {
                        return $this->success("添加成功！", url('goods/index'));
                    } else {
                        return $this->error($goods->getError());
                    }
                } else {
                    return $this->error($goods->getError());
                }
            } else {
                $data = array(
                    'keyList' => $goods->keyList,
                );
                $this->assign($data);
                $this->setMeta("添加产品");
                return $this->fetch('public/edit');
            }
        }
	}
}