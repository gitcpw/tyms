<!DOCTYPE html>
<!--[if IE 9]>         <html class="ie9 no-focus" lang="zh"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="no-focus" lang="zh"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <title>跳转提示 | {:config('web_site_title')} - DolphinPHP</title>
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0">
	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<style>
		@font-face {
			font-family: 'FontAwesome';
			src: url('__PUBLIC__/fonts/fontawesome-webfont.eot?v=4.7.0');
			src: url('__PUBLIC__/fonts/fontawesome-webfont.eot?#iefix&v=4.7.0') format('embedded-opentype'), url('__PUBLIC__/fonts/fontawesome-webfont.woff2?v=4.7.0') format('woff2'), url('__PUBLIC__/fonts/fontawesome-webfont.woff?v=4.7.0') format('woff'), url('__PUBLIC__/fonts/fontawesome-webfont.ttf?v=4.7.0') format('truetype'), url('__PUBLIC__/fonts/fontawesome-webfont.svg?v=4.7.0#fontawesomeregular') format('svg');
			font-weight: normal;
			font-style: normal;
		}
		body {
			font-family: "Microsoft Yahei", "Helvetica Neue", Helvetica, Arial, sans-serif;
			font-size: 14px;
			color: #646464;
			background-color: #f5f5f5;
		}
		.h1, h1 {
			font-size: 22px;
		}
		.overflow-hidden {
			overflow: hidden;
		}
		.pulldown {
			top: 100px;
		}
		.pulldown {
			position: relative;
		}
		.content {
			margin: 0 auto;
			padding: 30px 30px 1px;
			max-width: 960px;
		}
		.bg-white {
			background-color: #fff;
		}
		.text-muted {
			color: #999999;
		}
		.flipInX {
			-webkit-backface-visibility: visible !important;
			backface-visibility: visible !important;
			-webkit-animation-name: flipInX;
			animation-name: flipInX;
		}
		.animated {
			-webkit-animation-duration: 1s;
			animation-duration: 1s;
			-webkit-animation-fill-mode: both;
			animation-fill-mode: both;
		}
		.push-10 {
			margin-bottom: 10px !important;
		}
		.text-success {
			color: #46c37b;
		}
		.font-w300 {
			font-weight: 300 !important;
		}
		.fa {
			display: inline-block;
			font: normal normal normal 14px/1 FontAwesome;
			font-size: inherit;
			text-rendering: auto;
			-webkit-font-smoothing: antialiased;
			-moz-osx-font-smoothing: grayscale;
		}
		.fa-check-circle:before {
			content: "\f058";
		}
		.animated {
			-webkit-animation-duration: 1s;
			animation-duration: 1s;
			-webkit-animation-fill-mode: both;
			animation-fill-mode: both;
		}
		.push-20 {
			margin-bottom: 20px !important;
		}
		.font-w300 {
			font-weight: 300 !important;
		}
		p {
			line-height: 1.6;
		}
		.fadeInUp {
			-webkit-animation-name: fadeInUp;
			animation-name: fadeInUp;
		}
		a {
			color: #5c90d2;
			-webkit-transition: color 0.12s ease-out;
			transition: color 0.12s ease-out;
		}
		.push-50 {
			margin-bottom: 50px !important;
		}
		.btn.btn-minw {
			min-width: 110px;
		}
		.btn.btn-rounded {
			border-radius: 20px;
		}
		.btn-success {
			color: #fff;
			background-color: #46c37b;
			border-color: #34a263;
		}
		.btn {
			outline:none!important;
			font-weight: 600;
			border-radius: 2px;
			-webkit-transition: all 0.15s ease-out;
			transition: all 0.15s ease-out;
		}
		.fa {
			display: inline-block;
			font: normal normal normal 14px/1 FontAwesome;
			font-size: inherit;
			text-rendering: auto;
			-webkit-font-smoothing: antialiased;
			-moz-osx-font-smoothing: grayscale;
		}
		.fa-external-link-square:before {
			content: "\f14c";
		}
		.btn-warning {
			color: #fff;
			background-color: #f3b760;
			border-color: #efa231;
		}
		.fa-ban:before {
			content: "\f05e";
		}
		.btn-default {
			color: #545454;
			background-color: #f5f5f5;
			border-color: #e9e9e9;
		}
		.fa-home:before {
			content: "\f015";
		}
		
		@keyframes myfirst
		{
			from {top: 0;}
			to {top: 100px;}
		}
		@-moz-keyframes myfirst /* Firefox */
		{
			from {top: 0;}
			to {top: 100px;}
		}
		@-webkit-keyframes myfirst /* Safari 和 Chrome */
		{
			from {top: 0;}
			to {top: 100px;}
		}
		@-o-keyframes myfirst /* Opera */
		{
			from {top: 0;}
			to {top: 100px;}
		}
		.content{
			animation: myfirst 0.4s;
			-moz-animation: myfirst 0.4s;	/* Firefox */
			-webkit-animation: myfirst 0.4s;	/* Safari 和 Chrome */
			-o-animation: myfirst 0.4s;	/* Opera */
		}
	</style>
</head>
<body>
<!-- Error Content -->
<div class="content bg-white text-center pulldown overflow-hidden">
    <div class="row">
        <div class="col-sm-8 col-sm-offset-2">
            <!-- Error Titles -->
            <h1 class="font-w300 {$code? 'text-success' : 'text-city'} push-10 animated flipInX"><i class="fa fa-{$code? 'check' : 'times'}-circle"></i> <?php echo(strip_tags($msg));?></h1>
            <p class="font-w300 push-20 animated fadeInUp">页面自动 <a id="href" href="<?php echo($url);?>">跳转</a> 等待时间： <b id="wait"><?php echo($wait);?></b>秒</p>
            <div class="push-50">
                <a class="btn btn-minw btn-rounded btn-success" onclick="go_to('<?php echo($url);?>')" href="javascript:;" ><i class="fa fa-external-link-square"></i> 立即跳转</a>
                <button class="btn btn-minw btn-rounded btn-warning" type="button" onclick="stop()"><i class="fa fa-ban"></i> 禁止跳转</button>
                <!--a class="btn btn-minw btn-rounded btn-default" href="{:url('index/index')}"><i class="fa fa-home"></i> 返回首页</a-->
            </div>
            <!-- END Error Titles -->
        </div>
    </div>
</div>
<!-- END Error Content -->

<!-- Error Footer -->
<div class="content pulldown text-muted text-center">
    
</div>
<!-- END Error Footer -->
<script type="text/javascript">
    (function(){
        var wait = document.getElementById('wait'),
            href = document.getElementById('href').href;
        var interval = setInterval(function(){
            var time = --wait.innerHTML;
            if(time <= 0) {
                var data = '<?php echo $data ;?>';
                if(data == 'parent'){
					parent.location.href = href;
                }else{
                    location.href = href;
                }
                clearInterval(interval);
            };
        }, 1000);

        // 禁止跳转
        window.stop = function (){
            clearInterval(interval);
        }
    })();

    function go_to(url){
        var data = '<?php echo $data ;?>';
        //刷新父窗口,但不关闭layer
        if(data == 'p') {
            parent.layer.closeAll();
            parent.reiframe(href);
		}else if(data == 'parent'){
			parent.location.href = href;
        }else{
            location.href = url;
        }
    }
</script>
</body>
</html>