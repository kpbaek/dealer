<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User extends CI_Controller {

	function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		$this->load->view('/common/user/index');
	}
	
	public function ajaxLogin()
	{
		$this->load->view('/common/user/ajaxLogin');
	}
	
	public function logout()
	{
		$this->load->view('/common/user/logout');
	}

}
