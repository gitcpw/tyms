<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:40:"addons/systeminfo/view/index\widget.html";i:1500196927;}*/ ?>
<div class="col-lg-<?php echo $addons_config['width']; ?>">
	<div class="main-box clearfix">
		<header class="main-box-header clearfix">
			<h2><?php echo $addons_config['title']; ?></h2>
		</header>
		<div class="main-box-body clearfix">
			<table class="table">
				<tr>
					<th>核心版本</th>
					<td>YizuCMS v<?php echo YIZUCMS_VERSION; ?></td>
				</tr>
				<tr>
					<th>服务器操作系统</th>
					<td><?php echo PHP_OS; ?></td>
				</tr>
				<tr>
					<th>运行环境</th>
					<td><?php echo $_SERVER['SERVER_SOFTWARE']; ?></td>
				</tr>
				<tr>
					<th>MYSQL版本</th>
					<?php $system_info_mysql = \think\Db::query("select version() as v;"); ?>
					<td><?php echo $system_info_mysql['0']['v']; ?></td>
				</tr>
				<tr>
					<th>上传限制</th>
					<td><?php echo ini_get('upload_max_filesize'); ?></td>
				</tr>
				<tr>
					<th>系统版权所有</th>
					<td>
						<a href="http://www.yizukeji.cn/" target="_blank">四川蚁族科技有限公司</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>