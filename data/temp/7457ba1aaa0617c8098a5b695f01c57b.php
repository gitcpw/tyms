<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:36:"addons/sitestat/view/index\info.html";i:1500196927;}*/ ?>
<div class="col-lg-12">
	<div class="row">
		<div class="col-lg-3 col-sm-6 col-xs-12">
			<div class="main-box infographic-box colored emerald-bg"> <i class="fa fa-envelope"></i>
				<span class="headline">今日行为</span>
				<span class="value"><?php echo $info['action']; ?></span>
			</div>
		</div>
		<div class="col-lg-3 col-sm-6 col-xs-12">
			<div class="main-box infographic-box colored green-bg"> <i class="fa fa-money"></i>
				<span class="headline">栏目总数</span>
				<span class="value"><?php echo $info['category']; ?></span>
			</div>
		</div>
		<div class="col-lg-3 col-sm-6 col-xs-12">
			<div class="main-box infographic-box colored red-bg"> <i class="fa fa-user"></i>
				<span class="headline">用户总数</span>
				<span class="value"><?php echo $info['users']; ?></span>
			</div>
		</div>
		<div class="col-lg-3 col-sm-6 col-xs-12">
			<div class="main-box infographic-box colored purple-bg">
				<i class="fa fa-globe"></i>
				<span class="headline">模型总数</span>
				<span class="value"><?php echo $info['model']; ?></span>
			</div>
		</div>
	</div>
</div>