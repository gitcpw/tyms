<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:53:"F:\WWW\tyms/application/admin\view\category\edit.html";i:1500196927;s:51:"F:\WWW\tyms/application/admin\view\public\base.html";i:1500196927;s:53:"F:\WWW\tyms/application/admin\view\public\header.html";i:1500196927;s:51:"F:\WWW\tyms/application/admin\view\public\tool.html";i:1500196927;s:53:"F:\WWW\tyms/application/admin\view\public\footer.html";i:1500196927;}*/ ?>
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
			<h2><?php echo isset($info['id'])?'编辑':'新增'; ?>分类</h2>
		</div>
	</header>
	<div class="main-box-body clearfix">
		<form action="<?php echo url(); ?>" method="post" class="form form-horizontal">
			<div class="tabs-wrapper">
				<ul class="nav nav-tabs">
					<li class="active">
						<a href="#tab-base" data-toggle="tab">基 础</a>
					</li>
					<li><a href="#tab-better" data-toggle="tab">高 级</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade in active" id="tab-base">
						<div class="form-group">
							<label class="col-lg-2 control-label">上级分类</label>
							<div class="col-lg-8">
								<input type="hidden" name="pid" value="<?php echo (isset($category['id']) && ($category['id'] !== '')?$category['id']:0); ?>">
								<input type="text" class="form-control" disabled="disabled" value="<?php echo (isset($category['title']) && ($category['title'] !== '')?$category['title']:'无'); ?>"/>
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">分类名称</label>
							<div class="col-lg-8">
								<input type="text" name="title" class="form-control" value="<?php echo (isset($info['title']) && ($info['title'] !== '')?$info['title']:''); ?>">
								<span class="help-block">（名称不能为空）</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">分类标识</label>
							<div class="col-lg-8">
								<input type="text" name="name" class="form-control" value="<?php echo (isset($info['name']) && ($info['name'] !== '')?$info['name']:''); ?>">
								<span class="help-block">（英文字母）</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">分组定义</label>
							<div class="col-lg-8">
								<textarea name="groups" class="form-control"><?php echo (isset($info['groups']) && ($info['groups'] !== '')?$info['groups']:''); ?></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">发布内容</label>
							<div class="col-lg-8">
								<label class="am-radio-inline"><input type="radio" name="allow_publish" value="0">不允许</label>
								<label class="am-radio-inline"><input type="radio" name="allow_publish" value="1" checked>仅允许后台</label>
								<label class="am-radio-inline"><input type="radio" name="allow_publish" value="2" >允许前后台</label>
								<span class="help-block">（是否允许发布内容）</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">
								是否审核
							</label>
							<div class="col-lg-8">
								<label class="am-radio-inline"><input type="radio" name="check" value="0" checked>不需要</label>
								<label class="am-radio-inline"><input type="radio" name="check" value="1">需要</label>
								<span class="help-block">（在该分类下发布的内容是否需要审核）</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">分类图标</label>
							<div class="col-lg-8">
								<?php echo widget('common/Form/show',array(array('name'=>'icon','type'=>'image'),$info)); ?>
							</div>
						</div>
						
					</div>
					<div class="tab-pane fade" id="tab-better">

						<div class="form-group">
							<label class="col-lg-2 control-label">可见性</label>
							<div class="col-lg-3">
								<select name="display" class="form-control">
									<option value="1">所有人可见</option>
									<option value="0">不可见</option>
									<option value="2">管理员可见</option>
								</select>
								<span class="help-block">（是否对用户可见，针对前台）</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">排序</label>
							<div class="col-lg-2">
								<input type="text" name="sort" class="form-control" value="<?php echo (isset($info['sort']) && ($info['sort'] !== '')?$info['sort']:0); ?>">
								<span class="help-block">（仅对当前层级分类有效）</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">列表行数</label>
							<div class="col-lg-5">
								<input type="text" name="list_row" class="form-control" value="<?php echo (isset($info['list_row']) && ($info['list_row'] !== '')?$info['list_row']:10); ?>">
							</div>
						</div>

						<div class="form-group">
							<label class="col-lg-2 control-label">网页标题</label>
							<div class="col-lg-8">
								<input type="text" name="meta_title" class="form-control" value="<?php echo (isset($info['meta_title']) && ($info['meta_title'] !== '')?$info['meta_title']:''); ?>">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">关键字</label>
							<div class="col-lg-8">
								<textarea class="form-control" name="keywords"><?php echo (isset($info['keywords']) && ($info['keywords'] !== '')?$info['keywords']:''); ?></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">描述</label>
							<div class="col-lg-8">
								<textarea class="form-control" name="description"><?php echo (isset($info['description']) && ($info['description'] !== '')?$info['description']:''); ?></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">频道模板</label>
							<div class="col-lg-8">
								<input type="text" name="template_index" class="form-control" value="<?php echo (isset($info['template_index']) && ($info['template_index'] !== '')?$info['template_index']:''); ?>">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">列表模板</label>
							<div class="col-lg-8">
								<input type="text" name="template_lists" class="form-control" value="<?php echo (isset($info['template_lists']) && ($info['template_lists'] !== '')?$info['template_lists']:''); ?>">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">详情模板</label>
							<div class="col-lg-8">
								<input type="text" name="template_detail" class="form-control" value="<?php echo (isset($info['template_detail']) && ($info['template_detail'] !== '')?$info['template_detail']:''); ?>">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">编辑模板</label>
							<div class="col-lg-8">
								<input type="text" name="template_edit" class="form-control" value="<?php echo (isset($info['template_edit']) && ($info['template_edit'] !== '')?$info['template_edit']:''); ?>">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10">
					<input type="hidden" name="id" value="<?php echo (isset($info['id']) && ($info['id'] !== '')?$info['id']:''); ?>">
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

<link rel="stylesheet" type="text/css" href="__PUBLIC__/plugs/webuploader/webuploader.css">
<script type="text/javascript" src="__PUBLIC__/plugs/webuploader/webuploader.min.js"></script>
<script type="text/javascript" src="__PUBLIC__/plugs/webuploader/webuploader.custom.js"></script>
<script type="text/javascript">
	<?php if(isset($info['id'])): ?>
	Sent.setValue("allow_publish", <?php echo (isset($info['allow_publish']) && ($info['allow_publish'] !== '')?$info['allow_publish']:1); ?>);
	Sent.setValue("check", <?php echo (isset($info['check']) && ($info['check'] !== '')?$info['check']:0); ?>);
	Sent.setValue("model[]", <?php echo json_encode($info['model']); ?> || [1]);
	Sent.setValue("model_sub[]", <?php echo json_encode($info['model_sub']); ?> || [1]);
	Sent.setValue("type[]", <?php echo json_encode($info['type']); ?> || [2]);
	Sent.setValue("display", <?php echo (isset($info['display']) && ($info['display'] !== '')?$info['display']:1); ?>);
	Sent.setValue("reply", <?php echo (isset($info['reply']) && ($info['reply'] !== '')?$info['reply']:0); ?>);
	Sent.setValue("reply_model[]", <?php echo json_encode($info['reply_model']); ?> || [1]);
	<?php endif; ?>
	$(function(){
		$("input[name=reply]").change(function(){
			var $reply = $(".form-group.reply");
			parseInt(this.value) ? $reply.show() : $reply.hide();
		}).filter(":checked").change();
	});
</script>
