<?php
namespace app\index\controller;
use app\common\logic\WechatLogic;

/*
 * 微信公众号
 * */
class Weixin{
    /**
     * 处理接收推送消息
     */
    public function index()
    {
        $logic = new WechatLogic;
        $logic->handleMessage();
    }
}