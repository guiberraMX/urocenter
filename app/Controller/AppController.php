<?php
/**
 * Application level Controller
 *
 * This file is application-wide controller file. You can put all
 * application-wide controller-related methods here.
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       app.Controller
 * @since         CakePHP(tm) v 0.2.9
 * @license       http://www.opensource.org/licenses/mit-license.php MIT License
 */

App::uses('Controller', 'Controller');

/**
 * Application Controller
 *
 * Add your application-wide methods in the class below, your controllers
 * will inherit them.
 *
 * @package		app.Controller
 * @link		http://book.cakephp.org/2.0/en/controllers.html#the-app-controller
 */
class AppController extends Controller {
	public $components = array(
		'Auth'=>array(
			'authorize'=>array('Controller'),
			'loginRedirect' => array(
				'controller'=>'users',
				'action'=>'login_redirect'
				)
			),
		'Session'
		);

	public function isAuthorized($user){
		return true;
	}


	public function beforeFilter()
	{

		


		$this->loadModel('Menu');
		$this->Menu->unbindModel(array(
			'belongsTo' => array(
				'Role'
				)
			)
		);
		$this->Menu->recursive = 2;
		$menus_bar = $this->Menu->find('all', array(
			'conditions'=>array(
				'Menu.child_menu' => 0
				)
			)
		);

		$this->loadModel('User');
		$is_admin = $this->User->isAdmin($this->Auth->user()['id']);

		$this->set(compact('menus_bar', 'is_admin'));
		
		
		$this->layout = 'agile';


		

		//pr($menus);

	}


}




