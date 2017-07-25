<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:60:"F:\WWW\tyms/application/common\view\default\form\images.html";i:1500196927;}*/ ?>
	<div class="picker-box">
		<div id="picker_<?php echo $field; ?>" class="picker_button">上传多图</div>
		<input type="hidden" name="<?php echo $field; ?>" id="field_<?php echo $field; ?>" <?php if($value != '0'): ?>value="<?php echo $value; ?>"<?php endif; ?>>
		<div id="fileList_<?php echo $field; ?>" class="upload-file-list-info" style="width:280px;">
			<?php if($value): 
			$img_list = explode(',',$value);
			 if(is_array($img_list) || $img_list instanceof \think\Collection || $img_list instanceof \think\Paginator): $i = 0; $__LIST__ = $img_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;
			$images = get_cover($item);
			 ?>
			<li class="affix-list-item" id="WU_FILE_<?php echo $key; ?>">
				<div class="upload-file-info">
					<span class="webuploader-pick-file-close" data-queued-id="WU_FILE_<?php echo $key; ?>" data-id="<?php echo $item; ?>" data-fileurl="<?php echo $images['path']; ?>"><i class="close"></i></span>
					<span class="fname"></span>
					<span class="fsize">上传时间:<?php echo date('Y-m-d H:i:s',$images['create_time']); ?></span>
					<div class="clearfix"></div>
				</div>
				<div class="filebox image">
					<img src="<?php echo config('base_url'); ?><?php echo $images['path']; ?>" class="img-responsive">
				</div>
			</li>
			<?php endforeach; endif; else: echo "" ;endif; endif; ?>
		</div>
	</div>
	<script type="text/javascript">
		uploadsize =  2;
		$(function(){
			$("#picker_<?php echo $field; ?>").SentUploader({
					uploadEvents: {
						uploadComplete:function(file){}
					},
					listName : 'fileList_<?php echo $field; ?>',
					hiddenName: 'field_<?php echo $field; ?>',
					hiddenValType:1,
					fileSingleSizeLimit:uploadsize*1024*1024,
					closeX:true
				},
				{
					fileType: 'service',
					filename : 'images',
				});
		});
	</script>