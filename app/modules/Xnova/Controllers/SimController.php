<?php

namespace Xnova\Controllers;

/**
 * @author AlexPro
 * @copyright 2008 - 2018 XNova Game Group
 * Telegram: @alexprowars, Skype: alexprowars, Email: alexprowars@gmail.com
 */

use Xnova\Controller;
use Xnova\Vars;

/**
 * @RoutePrefix("/sim")
 * @Route("/")
 * @Private
 */
class SimController extends Controller
{
	public function initialize ()
	{
		parent::initialize();
		
		if ($this->dispatcher->wasForwarded())
			return;

		$this->user->loadPlanet();
	}

	/**
	 * @Route("/{data:[0-9!;,]+}{params:(/.*)*}")
	 * @param string $data
	 */
	public function indexAction ($data = '')
	{
		$data = explode(";", $data);

		define('MAX_SLOTS', $this->config->game->get('maxSlotsInSim', 5));
		
		$parse = [];
		$parse['slot_0'] = [];
		$parse['slot_'.MAX_SLOTS] = [];

		$parse['tech'] = [109, 110, 111, 120, 121, 122];
		
		foreach ($data AS $row)
		{
			if ($row != '')
			{
				$Element = explode(",", $row);
				$Count = explode("!", $Element[1]);

				if (isset($Count[1]))
					$parse['slot_'.MAX_SLOTS][$Element[0]] = ['c' => $Count[0], 'l' => $Count[1]];
			}
		}
		
		$res = Vars::getItemsByType([Vars::ITEM_TYPE_FLEET, Vars::ITEM_TYPE_DEFENSE, Vars::ITEM_TYPE_TECH]);
		
		foreach ($res AS $id)
		{
			if ($this->planet->getUnitCount($id) > 0)
				$parse['slot_0'][$id] = ['c' => $this->planet->getUnitCount($id)];
		
			if ($this->user->getTechLevel($id) > 0)
				$parse['slot_0'][$id] = ['c' => $this->user->getTechLevel($id)];
		}

		$this->view->setVar('parse', $parse);

		$this->tag->setTitle('Симулятор');
		$this->showTopPanel(false);
	}
}