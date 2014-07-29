<?php $this->layout = 'agile_blank'; ?>


<h4 class="heading-1 clearfix">
	<div class="heading-content">
		<?php echo __('Add User'); ?>       	       
    	<!-- <small>
            File Upload widget with multiple file selection, drag&drop support, progress bars, validation and preview images, audio and video for jQuery.
        </small> -->
    </div>
    <div class="clear"></div>
    <div class="divider"></div>
</h4>

<?php echo $this->Form->create('User', array(
	'inputDefaults'=>array(
		'div'=>false
		),
	'action'=>'add'
)); ?>


<div class="form-row">
			<div class="form-label col-md-2">
			<label for="username" class=" text-transform-cap ">
			username
			</label>
			</div><div class="form-input col-md-10">		 <?= $this->Form->input('username', array(
			'label'=>false
			)) ?> 
	</div>
</div><div class="form-row">
			<div class="form-label col-md-2">
			<label for="password" class=" text-transform-cap ">
			password
			</label>
			</div><div class="form-input col-md-10">		 <?= $this->Form->input('password', array(
			'label'=>false
			)) ?> 
	</div>
</div><div class="form-row">
			<div class="form-label col-md-2">
			<label for="email" class=" text-transform-cap ">
			email
			</label>
			</div><div class="form-input col-md-10">		 <?= $this->Form->input('email', array(
			'label'=>false
			)) ?> 
	</div>
</div>		




<br>

<button class="btn medium primary-bg submit" type="submit">Registrarse <i class="fa fa-check"></i></button>

<?php echo $this->Form->end(); ?>
<br>
<br>



<!-- ################ -->
<!--
<div class="users form">
<?php echo $this->Form->create('User'); ?>
	<fieldset>
		<legend><?php echo __('Add User'); ?></legend>
	<?php
		echo $this->Form->input('username');
		echo $this->Form->input('password');
		echo $this->Form->input('email');
		echo $this->Form->input('Role');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit')); ?>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('List Users'), array('action' => 'index')); ?></li>
		<li><?php echo $this->Html->link(__('List User Answers'), array('controller' => 'user_answers', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New User Answer'), array('controller' => 'user_answers', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Roles'), array('controller' => 'roles', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Role'), array('controller' => 'roles', 'action' => 'add')); ?> </li>
	</ul>
</div>
-->