<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:64:"D:\phpStudy\WWW\sentcms/application/admin\view\config\group.html";i:1499155829;s:63:"D:\phpStudy\WWW\sentcms/application/admin\view\public\base.html";i:1499699582;s:65:"D:\phpStudy\WWW\sentcms/application/admin\view\public\header.html";i:1499698928;s:63:"D:\phpStudy\WWW\sentcms/application/admin\view\public\tool.html";i:1499155829;s:65:"D:\phpStudy\WWW\sentcms/application/admin\view\public\footer.html";i:1499698928;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>YizuCMS网站管理系统后台</title>
<link rel="stylesheet" type="text/css" href="__PUBLIC__/css/bootstrap/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="__PUBLIC__/css/libs/font-awesome.css"/>
<link rel="stylesheet" type="text/css" href="__PUBLIC__/css/libs/nanoscroller.css"/>
<link rel="stylesheet" type="text/css" href="__PUBLIC__/css/common.css"/>
<!-- <link href='//fonts.googleapis.com/css?family=Open+Sans:400,600,700,300|Titillium+Web:200,300,400' rel='stylesheet' type='text/css'> -->
<link rel="stylesheet" type="text/css" href="__CSS__/style.css"/>
<script src="__PUBLIC__/js/jquery.js"></script>
<script type="text/javascript">
	var BASE_URL = "<?php echo config('base_url'); ?>"; //根目录地址
</script>
<!--[if lt IE 9]>
<script src="__PUBLIC__/js/html5shiv.js"></script>
<script src="__PUBLIC__/js/respond.min.js"></script>
<![endif]-->
</head>
<body>

<div id="theme-wrapper">
	<header class="navbar" id="header-navbar">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#header-nav">
					<span class="sr-only">菜单</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="<?php echo url('Index/index'); ?>" id="logo" class="navbar-brand">
					<img src="__PUBLIC__/images/logo.png" alt="" class="normal-logo logo-white"/>
				</a>
				<ul class="nav navbar-nav pull-right visible-xs">
					<li class="dropdown profile-dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<img src="__PUBLIC__/images/samples/scarlet-159.png" alt=""/>
							<span class="hidden-xs"><?php echo session('user_auth.username'); ?></span> <b class="caret"></b>
						</a>
						<ul class="dropdown-menu dropdown-menu-right">
							<li>
								<a href="<?php echo url('admin/User/edit'); ?>">
									<i class="fa fa-user"></i>
									修改资料
								</a>
							</li>
							<li>
								<a href="<?php echo url('admin/User/editpwd'); ?>">
									<i class="fa fa-cog"></i>
									修改密码
								</a>
							</li>
							<li>
								<a href="<?php echo url('admin/index/logout'); ?>">
									<i class="fa fa-power-off"></i>
									退出后台
								</a>
							</li>
							<li>
								<a href="<?php echo config('WEB_SITE_URL'); ?>" target="_blank">
									<i class="fa fa-home"></i>
									前台首页
								</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
			<div class="nav-no-collapse navbar-left pull-left hidden-sm hidden-xs">
				<ul class="nav navbar-nav pull-left">
					<li>
						<a class="btn" id="make-small-nav"> <i class="fa fa-bars"></i>
						</a>
					</li>
				</ul>
			</div>
			<div class="collapse navbar-collapse" id="header-nav">
				<ul class="nav navbar-nav">
					<?php if(is_array($__menu__['main']) || $__menu__['main'] instanceof \think\Collection || $__menu__['main'] instanceof \think\Paginator): $i = 0; $__LIST__ = $__menu__['main'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?>
					<li class="<?php echo $item['style']; ?>">
					<a href="<?php echo url($item['url']); ?>">
						<i class="fa fa-<?php echo (isset($item['icon']) && ($item['icon'] !== '')?$item['icon']:'file'); ?>"></i>
						<span><?php echo $item['title']; ?></span>
					</a>
					</li>
					<?php endforeach; endif; else: echo "" ;endif; ?>
				</ul>
				<ul class="nav navbar-nav pull-right">
					<li class="dropdown profile-dropdown hidden-sm hidden-xs">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<img src="__PUBLIC__/images/samples/scarlet-159.png" alt=""/>
							<span class="hidden-xs"><?php echo session('user_auth.username'); ?></span> <b class="caret"></b>
						</a>
						<ul class="dropdown-menu dropdown-menu-right">
							<li>
								<a href="<?php echo url('admin/User/edit'); ?>">
									<i class="fa fa-user"></i>
									修改资料
								</a>
							</li>
							<li>
								<a href="<?php echo url('admin/User/editpwd'); ?>">
									<i class="fa fa-cog"></i>
									修改密码
								</a>
							</li>
							<li>
								<a href="<?php echo url('admin/index/logout'); ?>">
									<i class="fa fa-power-off"></i>
									退出后台
								</a>
							</li>
							<li>
								<a href="<?php echo config('WEB_SITE_URL'); ?>" target="_blank">
									<i class="fa fa-home"></i>
									前台首页
								</a>
							</li>
						</ul>
					</li>
					<li class="visible-lg">
						<a href="#" class="btn" onclick="helpIntro();">
							<i class="fa fa-question-circle"></i>
							操作指南
						</a>
					</li>
				</ul>
			</div>
		</div>
	</header>

	<div id="page-wrapper" class="container nav-small">
		<div class="row">
			<div id="nav-col">
				<section id="col-left" class="col-left-nano">
					<div id="col-left-inner" class="col-left-nano-content">
						<div id="sidebar-nav">
							<ul class="nav nav-pills nav-stacked">
								<?php if(is_array($__menu__['child']) || $__menu__['child'] instanceof \think\Collection || $__menu__['child'] instanceof \think\Paginator): $i = 0; $__LIST__ = $__menu__['child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$nav): $mod = ($i % 2 );++$i;?>
								<li class="nav-header hidden-sm hidden-xs"><?php echo $key; ?></li>
								<?php if(is_array($nav) || $nav instanceof \think\Collection || $nav instanceof \think\Paginator): $i = 0; $__LIST__ = $nav;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;if(isset($item['_child'])): ?>
								<li class="<?php echo $item['style']; ?>">
									<a href="#" class="dropdown-toggle">
										<i class="fa fa-<?php echo (isset($item['icon']) && ($item['icon'] !== '')?$item['icon']:'file'); ?>"></i>
										<span><?php echo $item['title']; ?></span>
										<i class="fa fa-angle-right drop-icon"></i>
									</a>
									<ul class="submenu">
										<?php if(is_array($item['_child']) || $item['_child'] instanceof \think\Collection || $item['_child'] instanceof \think\Paginator): $k = 0; $__LIST__ = $item['_child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($k % 2 );++$k;?>
										<li class="<?php echo $vo['style']; ?>">
											<a href="<?php echo url($vo['url']); ?>">
												<i class="fa fa-<?php echo (isset($vo['icon']) && ($vo['icon'] !== '')?$vo['icon']:'file'); ?>"></i>
												<span><?php echo $vo['title']; ?></span>
											</a>
										</li>
										<?php endforeach; endif; else: echo "" ;endif; ?>
									</ul>
								</li>
								<?php else: ?>
								<li class="<?php echo $item['style']; ?>">
									<a href="<?php echo url($item['url']); ?>">
										<i class="fa fa-<?php echo (isset($item['icon']) && ($item['icon'] !== '')?$item['icon']:'file'); ?>"></i>
										<span><?php echo $item['title']; ?></span>
									</a>
								</li>
								<?php endif; endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; if(isset($extend_menu)): if(is_array($extend_menu) || $extend_menu instanceof \think\Collection || $extend_menu instanceof \think\Paginator): $i = 0; $__LIST__ = $extend_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub): $mod = ($i % 2 );++$i;if(is_string($key)): ?><li class="nav-header hidden-sm hidden-xs"><?php echo $key; ?></li><?php endif; if(is_array($sub) || $sub instanceof \think\Collection || $sub instanceof \think\Paginator): $i = 0; $__LIST__ = $sub;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?>
									<li class="<?php echo $item['style']; ?>">
										<a href="<?php echo url($item['url']); ?>">
											<i class="fa fa-<?php echo (isset($item['icon']) && ($item['icon'] !== '')?$item['icon']:'file'); ?>"></i>
											<span><?php echo $item['title']; ?></span>
										</a>
									</li>
									<?php endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; endif; ?>
							</ul>
						</div>
					</div>
				</section>
				<div id="nav-col-submenu"></div>
			</div>

			<div id="content-wrapper">
				<div class="row">
					<div class="col-lg-12">
						<div class="row">
							<div class="col-lg-12">
								<div id="content-header" class="clearfix">
									<div class="pull-left">
										<ol class="breadcrumb">
											<li>
												<a href="<?php echo url('Admin/Index/index'); ?>">后台首页</a>
											</li>
											<li class="active">
												<?php if($meta_title): ?>
												<span><?php echo $meta_title; ?></span>
												<?php else: ?>
												<span><?php echo lang(request()->controller().'_'.request()->action()); ?></span>
												<?php endif; ?>
											</li>
										</ol>
									</div>
									<div class="pull-right hidden-xs">
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								

<div class="main-box clearfix">
	<header class="main-box-header clearfix">
		<div class="pull-left">
			<h2>配置管理</h2>
		</div>
		<div class="pull-right">
			<a href="<?php echo url('Config/index'); ?>" class="btn btn-primary">
				<i class="fa fa-list"></i> 
				配置列表
			</a>
			<a href="<?php echo url('Config/add'); ?>" class="btn btn-danger">
				<i class="fa fa-list"></i> 
				添加配置
			</a>
		</div>
	</header>
	<div class="main-box-body clearfix">
		<div class="tabs-wrapper">
			<ul class="nav nav-tabs">
				<?php $_result=config('config_group_list');if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?>
				<li <?php if($key == $id): ?>class="active"<?php endif; ?>>
					<a href="<?php echo url('Config/group',array('id'=>$key)); ?>"><?php echo $item; ?></a>
				</li>
				<?php endforeach; endif; else: echo "" ;endif; ?>
			</ul>
			<div class="tab-content">
				<div class="tab-pane fade in active" id="tab-home">
					<form method="post" class="form form-horizontal" role="form">
						<?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?>
						<div class="form-group">
							<label for="inputEmail1" class="col-lg-2 control-label"><?php echo $item['title']; ?></label>
							<div class="col-lg-10">
								<?php switch($item['type']): case "text": ?>
								<input type="text" class="form-control" name="config[<?php echo $item['name']; ?>]" id="config[<?php echo $item['name']; ?>]" value="<?php echo $item['value']; ?>" placeholder="<?php echo $item['title']; ?>" style="width:50%;">
								<?php break; case "num": ?>
								<input type="text" class="form-control" name="config[<?php echo $item['name']; ?>]" id="config[<?php echo $item['name']; ?>]" value="<?php echo $item['value']; ?>" placeholder="<?php echo $item['title']; ?>" style="width:30%;">
								<?php break; case "string": ?>
								<input type="text" class="form-control" name="config[<?php echo $item['name']; ?>]" id="config[<?php echo $item['name']; ?>]" value="<?php echo $item['value']; ?>" placeholder="<?php echo $item['title']; ?>" style="width:80%;">
								<?php break; case "textarea": ?>
								<textarea class="form-control" name="config[<?php echo $item['name']; ?>]" id="config[<?php echo $item['name']; ?>]" style="width:80%; height:120px;"><?php echo $item['value']; ?></textarea>
								<?php break; case "select": ?>
								<select class="form-control" name="config[<?php echo $item['name']; ?>]" id="config[<?php echo $item['name']; ?>]" style="width:auto;">
									<?php $_result=parse_config_attr($item['extra']);if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
									<option value="<?php echo $key; ?>" <?php if($item['value'] == $key): ?>selected<?php endif; ?>><?php echo $vo; ?></option>
									<?php endforeach; endif; else: echo "" ;endif; ?>
								</select>
								<?php break; case "bool": ?>
								<select class="form-control" name="config[<?php echo $item['name']; ?>]" id="config[<?php echo $item['name']; ?>]" style="width:auto;">
									<?php $_result=parse_config_attr($item['extra']);if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
									<option value="<?php echo $key; ?>" <?php if($item['value'] == $key): ?>selected<?php endif; ?>><?php echo $vo; ?></option>
									<?php endforeach; endif; else: echo "" ;endif; ?>
								</select>
								<?php break; endswitch; if($item['remark']): ?>
								<span class="help-block">（<?php echo $item['remark']; ?>）</span>
								<?php endif; ?>
							</div>
						</div>
						<?php endforeach; endif; else: echo "" ;endif; ?>
						<div class="form-group">
							<div class="col-lg-offset-2 col-lg-10">
								<button type="submit" class="btn btn-success submit-btn ajax-post" target-form="form">确认提交</button>
								<button class="btn btn-danger btn-return" onclick="javascript:history.back(-1);return false;">返 回</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


							</div>
						</div>
					</div>
				</div>
				<footer id="footer-bar" class="row">
					<p id="footer-copyright" class="col-xs-12">Powered by <a href="http://www.yizukeji.cn" target="_blank">YizuCMS,Inc.</a></p>
				</footer>
			</div>
		</div>
	</div>
</div>
<div id="config-tool" class="closed hidden-sm">
	<a id="config-tool-cog">
		<i class="fa fa-cog"></i>
	</a>
	<div id="config-tool-options">
		<h4>布局选项</h4>
		<ul>
			<li>
				<div class="checkbox-nice">
					<input type="checkbox" id="config-boxed-layout"/>
					<label for="config-boxed-layout">内嵌布局</label>
				</div>
			</li>
			<li>
				<div class="checkbox-nice">
					<input type="checkbox" id="config-sidebar-samll"/>
					<label for="config-sidebar-samll">小菜单</label>
				</div>
			</li>
		</ul>
		<br/>
		<h4>皮肤颜色</h4>
		<ul id="skin-colors" class="clearfix">
			<li>
				<a class="skin-changer" data-skin="" data-toggle="tooltip" title="默认" style="background-color: #34495e;"></a>
			</li>
			<li>
				<a class="skin-changer" data-skin="theme-white" data-toggle="tooltip" title="白/绿" style="background-color: #2ecc71;"></a>
			</li>
			<li>
				<a class="skin-changer blue-gradient" data-skin="theme-blue-gradient" data-toggle="tooltip" title="渐变"></a>
			</li>
			<li>
				<a class="skin-changer" data-skin="theme-turquoise" data-toggle="tooltip" title="绿色海洋" style="background-color: #1abc9c;"></a>
			</li>
			<li>
				<a class="skin-changer" data-skin="theme-amethyst" data-toggle="tooltip" title="紫水晶" style="background-color: #9b59b6;"></a>
			</li>
			<li>
				<a class="skin-changer" data-skin="theme-blue" data-toggle="tooltip" title="蓝色" style="background-color: #2980b9;"></a>
			</li>
			<li>
				<a class="skin-changer" data-skin="theme-red" data-toggle="tooltip" title="红色" style="background-color: #e74c3c;"></a>
			</li>
			<li>
				<a class="skin-changer" data-skin="theme-whbl" data-toggle="tooltip" title="白/蓝" style="background-color: #3498db;"></a>
			</li>
		</ul>
	</div>
</div>
<script src="__JS__/skin-changer.js"></script> 
<script src="__PUBLIC__/js/bootstrap.js"></script>
<script src="__PUBLIC__/js/jquery.nanoscroller.min.js"></script>
<script src="__PUBLIC__/js/pace.min.js"></script>

<script src="__PUBLIC__/js/hopscotch.js"></script>
<link rel="stylesheet" type="text/css" href="__PUBLIC__/css/libs/hopscotch.css">

<script src="__PUBLIC__/js/messager.js"></script>
<script src="__JS__/app.js"></script>
<script type="text/javascript">
(function(){
	var YizuCMS = window.Sent = {
		"ROOT"   : "__ROOT__", //当前网站地址
		"APP"    : "__APP__", //当前项目地址
		"PUBLIC" : "__PUBLIC__", //项目公共目录地址
		"DEEP"   : "<?php echo config('URL_PATHINFO_DEPR'); ?>", //PATHINFO分割符
		"MODEL"  : ["<?php echo config('URL_MODEL'); ?>", "<?php echo config('URL_CASE_INSENSITIVE'); ?>", "<?php echo config('URL_HTML_SUFFIX'); ?>"],
		"VAR"    : ["<?php echo config('VAR_MODULE'); ?>", "<?php echo config('VAR_CONTROLLER'); ?>", "<?php echo config('VAR_ACTION'); ?>"]
	}
})();
</script>
<script src="__PUBLIC__/js/core.js"></script>
</body>
</html>
