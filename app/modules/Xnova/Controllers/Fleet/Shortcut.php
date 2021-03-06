<?php

namespace Xnova\Controllers\Fleet;

/**
 * @author AlexPro
 * @copyright 2008 - 2018 XNova Game Group
 * Telegram: @alexprowars, Skype: alexprowars, Email: alexprowars@gmail.com
 */

use Xnova\Controllers\FleetController;
use Xnova\Exceptions\RedirectException;
use Xnova\Request;

class Shortcut
{
	public function show (FleetController $controller)
	{
		$inf = $controller->db->query("SELECT fleet_shortcut FROM game_users_info WHERE id = " . $controller->user->id . ";")->fetch();

		if ($controller->request->hasQuery('add'))
		{
			if ($controller->request->isPost())
			{
				$name = $controller->request->getPost('n', 'string', '');

				if ($name == '' || !preg_match("/^[a-zA-Zа-яА-Я0-9_\.\,\-\!\?\*\ ]+$/u", $name))
					$name = 'Планета';

				$g = (int) $controller->request->getPost('g', 'int', 0);
				$s = (int) $controller->request->getPost('s', 'int', 0);
				$p = (int) $controller->request->getPost('p', 'int', 0);
				$t = (int) $controller->request->getPost('t', 'int', 0);

				if ($g < 1 || $g > $controller->config->game->maxGalaxyInWorld)
					$g = 1;
				if ($s < 1 || $s > $controller->config->game->maxSystemInGalaxy)
					$s = 1;
				if ($p < 1 || $p > $controller->config->game->maxPlanetInSystem)
					$p = 1;
				if ($t != 1 && $t != 2 && $t != 3 && $t != 5)
					$t = 1;

				$inf['fleet_shortcut'] .= strip_tags(str_replace(',', '', $name)) . "," . $g . "," . $s . "," . $p . "," . $t . "\r\n";

				$controller->db->updateAsDict('game_users_info', ['fleet_shortcut' => $inf['fleet_shortcut']], 'id = '.$controller->user->getId());

				if ($controller->session->has('fleet_shortcut'))
					$controller->session->remove('fleet_shortcut');

				throw new RedirectException("Ссылка на планету добавлена!", "Добавление ссылки", "/fleet/shortcut/", 1);
			}

			$g = (int) $controller->request->get('g', 'int', 0);
			$s = (int) $controller->request->get('s', 'int', 0);
			$p = (int) $controller->request->get('p', 'int', 0);
			$t = (int) $controller->request->get('t', 'int', 0);

			if ($g < 1 || $g > $controller->config->game->maxGalaxyInWorld)
				$g = 1;
			if ($s < 1 || $s > $controller->config->game->maxSystemInGalaxy)
				$s = 1;
			if ($p < 1 || $p > $controller->config->game->maxPlanetInSystem)
				$p = 1;
			if ($t != 1 && $t != 2 && $t != 3 && $t != 5)
				$t = 1;

			Request::addData('page', [
				'id' => -1,
				'name' => '',
				'galaxy' => $g,
				'system' => $s,
				'planet' => $p,
				'type' => $t,
			]);
		}
		elseif ($controller->request->hasQuery('view'))
		{
			$id = (int) $controller->request->getQuery('view', 'int', 0);

			if ($controller->request->isPost())
			{
				$scarray = explode("\r\n", $inf['fleet_shortcut']);

				if (!isset($scarray[$id]))
					$controller->response->redirect('fleet/shortcut/');

				if ($controller->request->hasPost('delete'))
				{
					unset($scarray[$id]);
					$inf['fleet_shortcut'] = implode("\r\n", $scarray);

					$controller->db->updateAsDict('game_users_info', [
						'fleet_shortcut' => $inf['fleet_shortcut']
					], 'id = '.$controller->user->getId());

					if ($controller->session->has('fleet_shortcut'))
						$controller->session->remove('fleet_shortcut');

					throw new RedirectException("Ссылка была успешно удалена!", "Удаление ссылки", "/fleet/shortcut/", 1);
				}
				else
				{
					$r = explode(",", $scarray[$id]);

					$r[0] = strip_tags(str_replace(',', '', $controller->request->getPost('n', 'string', '')));
					$r[1] = (int) $controller->request->getPost('g', 'int', 0);
					$r[2] = (int) $controller->request->getPost('s', 'int', 0);
					$r[3] = (int) $controller->request->getPost('p', 'int', 0);
					$r[4] = (int) $controller->request->getPost('t', 'int', 0);

					if ($r[1] < 1 || $r[1] > $controller->config->game->maxGalaxyInWorld)
						$r[1] = 1;
					if ($r[2] < 1 || $r[2] > $controller->config->game->maxSystemInGalaxy)
						$r[2] = 1;
					if ($r[3] < 1 || $r[3] > $controller->config->game->maxPlanetInSystem)
						$r[3] = 1;
					if ($r[4] != 1 && $r[4] != 2 && $r[4] != 3 && $r[4] != 5)
						$r[4] = 1;

					$scarray[$id] = implode(",", $r);
					$inf['fleet_shortcut'] = implode("\r\n", $scarray);

					$controller->db->updateAsDict('game_users_info', [
						'fleet_shortcut' => $inf['fleet_shortcut']
					], 'id = '.$controller->user->getId());

					if ($controller->session->has('fleet_shortcut'))
						$controller->session->remove('fleet_shortcut');

					throw new RedirectException("Ссылка была обновлена!", "Обновление ссылки", "/fleet/shortcut/", 1);
				}
			}

			if ($inf['fleet_shortcut'])
			{
				$scarray = explode("\r\n", $inf['fleet_shortcut']);

				if (isset($scarray[$id]))
				{
					$c = explode(',', $scarray[$id]);

					Request::addData('page', [
						'id' => $id,
						'name' => $c[0],
						'galaxy' => (int) $c[1],
						'system' => (int) $c[2],
						'planet' => (int) $c[3],
						'type' => (int) $c[4],
					]);
				}
				else
					throw new RedirectException("Данной ссылки не существует!", "Ссылки", "/fleet/shortcut/");
			}
			else
				throw new RedirectException("Ваш список быстрых ссылок пуст!", "Ссылки", "/fleet/shortcut/");
		}
		else
		{
			$links = [];

			if ($inf['fleet_shortcut'])
			{
				$scarray = explode("\r\n", $inf['fleet_shortcut']);

				foreach ($scarray as $a => $b)
				{
					if ($b != '')
					{
						$c = explode(',', $b);

						$type = '';

						if ($c[4] == 2)
							$type = " (E)";
						elseif ($c[4] == 3)
							$type = " (L)";
						elseif ($c[4] == 5)
							$type = " (B)";

						$links[] =
						[
							'name' => $c[0],
							'galaxy' => $c[1],
							'system' => $c[2],
							'planet' => $c[3],
							'type'=> $type
						];
					}
				}
			}

			Request::addData('page', [
				'items' => $links
			]);
		}

		$controller->tag->setTitle("Закладки");
	}
}