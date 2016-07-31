<?php

namespace Xnova\Controllers;

/**
 * @author AlexPro
 * @copyright 2008 - 2016 XNova Game Group
 * Telegram: @alexprowars, Skype: alexprowars, Email: alexprowars@gmail.com
 */

use Xnova\Controller;

/**
 * @RoutePrefix("/credits")
 * @Route("/")
 * @Route("/{action}/")
 * @Route("/{action}{params:(/.*)*}")
 * @Private
 */
class CreditsController extends Controller
{
	public function initialize ()
	{
		parent::initialize();
	}
	
	public function indexAction ()
	{
		$userinf = $this->db->query("SELECT email FROM game_users_info WHERE id = " . $this->user->getId())->fetch();

		if ($this->session->has('OKAPI'))
		{
			$params = [];
			$params['application_key'] = $this->config->ok->public;
			$params['format'] = 'JSON';
			$params['uid'] = $this->session->get('OKAPI')['logged_user_id'];
			$params['message'] = 'Я прошел обучение в Звёздной Империи. Теперь настало время воевать!';

			ksort($params);

			$sig = '';

			foreach ($params as $k => $v)
				$sig .= $k.'='.$v;

			$sig .= $this->config->ok->private;

			$params['sig'] = md5($sig);

			$this->view->setLayout('credits_ok');
			$this->view->setVar('params', $params);
		}
		elseif ($this->request->hasPost('OutSum'))
		{
			do
			{
				$id = mt_rand(1000000000000, 9999999999999);
			}
			while (isset($this->db->fetchOne("SELECT id FROM game_users_payments WHERE transaction_id = ".$id)['id']));

			$this->view->setVar('invid', $id);
		}

		$this->view->setVar('userid', $this->user->getId());
		$this->view->setVar('useremail', $userinf['email']);

		$this->tag->setTitle('Покупка кредитов');
		$this->showTopPanel(false);
	}
}