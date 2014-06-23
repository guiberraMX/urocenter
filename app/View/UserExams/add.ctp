<div class="userExams form">
<?php echo $this->Form->create('UserExam'); ?>
	<fieldset>
		<legend><?php echo __('Add User Exam'); ?></legend>
	<?php
		echo $this->Form->input('exam_id');
		echo $this->Form->input('last_answer');
		echo $this->Form->input('exam_status_id');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit')); ?>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('List User Exams'), array('action' => 'index')); ?></li>
		<li><?php echo $this->Html->link(__('List Exams'), array('controller' => 'exams', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Exam'), array('controller' => 'exams', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Exam Statuses'), array('controller' => 'exam_statuses', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Exam Status'), array('controller' => 'exam_statuses', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List User Answers'), array('controller' => 'user_answers', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New User Answer'), array('controller' => 'user_answers', 'action' => 'add')); ?> </li>
	</ul>
</div>