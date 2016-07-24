<? if ($parse['bonus']): ?>
	<table class="table">
		<tr>
			<td class="c">Ежедневный бонус</td>
		</tr>
		<tr>
			<th>
				Сейчас вы можете получить по <b><?=($parse['bonus_multi'] * 500 * $this->game->getSpeed('mine')) ?></b> Металла, Кристаллов и Дейтерия.<br>
				Каждый день размер бонуса будет увеличиваться.<br>
				<br>
				<a href="<?=$this->url->get("overview/bonus/") ?>">ПОЛУЧИТЬ БОНУС</a><br><br>

				Помоги проекту, поделись им с друзьями!
				<script type="text/javascript" src="//yandex.st/share/share.js" charset="utf-8"></script>
				<div class="yashare-auto-init" data-yashareL10n="ru" data-yashareTitle="<?=$this->config->app->name ?>" data-yashareLink="//uni<?=$this->config->game->universe ?>.xnova.su/" data-yashareQuickServices="vkontakte,facebook,twitter,odnoklassniki,moimir,gplus" data-yashareTheme="counter" data-yashareType="small"></div>
			</th>
		</tr>
	</table>
	<div class="separator"></div>
<? endif; ?>

<div class="block">
	<div class="title">
		<div class="row">
			<div class="col-xs-12 col-sm-6">
				<?=_getText('type_planet', $parse['planet_type']) ?> "<?=$parse['planet_name'] ?>"
				<a href="<?=$this->url->get("galaxy/".$parse['galaxy_galaxy']."/".$parse['galaxy_system']."/") ?>">[<?=$parse['galaxy_galaxy'] ?>:<?=$parse['galaxy_system'] ?>:<?=$parse['galaxy_planet'] ?>]</a>
				<a href="<?=$this->url->get("overview/rename/") ?>" title="Редактирование планеты">(изменить)</a>
			</div>
			<div class="separator hidden-sm-up"></div>
			<div class="col-xs-12 col-sm-6">
				<div id="clock" class="pull-xs-right"><?=$this->game->datezone("d-m-Y H:i:s", time()) ?></div>
				<script type="text/javascript">UpdateClock();</script>
				<div class="clearfix hidden-sm-up"></div>
			</div>
		</div>
	</div>
	<div class="content">
		<? if (count($parse['fleet_list']) > 0): ?>
			<table class="table">
				<? foreach ($parse['fleet_list'] as $id => $list): ?>
					<tr class="<?=$list['fleet_status'] ?>">
					<th width="80">
						<div id="bxx<?=$list['fleet_order'] ?>" class="z"><?=$list['fleet_count_time'] ?></div>
						<div class="positive"><?=$list['fleet_time'] ?></div>
					</th>
					<th class="text-xs-left" colspan="3">
						<span class="<?=$list['fleet_status'] ?> <?=$list['fleet_prefix'] ?><?=$list['fleet_style'] ?>"><?=$list['fleet_descr'] ?></span>
					</th>
					<?= $list['fleet_javas'] ?>
					</tr>
				<? endforeach; ?>
			</table>
			<div class="separator"></div>
		<? endif; ?>
		<? $m = $this->config->app->get('newsMessage', ''); ?>
		<? if ($m != ''): ?>
			<div class="row">
				<div class="col-xs-3"><img src="<?=$this->url->getBaseUri() ?>assets/images/warning.png" align="absmiddle" alt=""></div>
				<div class="col-xs-9">
					<?=$m ?>
				</div>
			</div>
			<div class="separator"></div>
		<? endif; ?>
		<div class="row overview">
			<div class="col-sm-4 col-xs-12">
				<div class="row">
					<div class="col-md-10 col-sm-12 col-xs-5">
						<div class="planet-image">
							<a href="<?=$this->url->get("overview/rename/") ?>">
								<img src="<?=$this->url->getBaseUri() ?>assets/images/planeten/<?=$parse['planet_image'] ?>.jpg" alt="">
							</a>
							<? if ($parse['moon_img'] != ''): ?>
								<div class="moon-image"><?=$parse['moon_img'] ?></div>
							<? endif; ?>
						</div>

						<div class="separator"></div>

						<div style="border: 1px solid rgb(153, 153, 255); width: 100%; margin: 0 auto;">
							<div id="CaseBarre" style="background-color: #<?=($parse['case_pourcentage'] > 80 ? 'C00000' : ($parse['case_pourcentage'] > 60 ? 'C0C000' : '00C000')) ?>; width: <?=$parse['case_pourcentage'] ?>%;  margin: 0 auto; text-align:center;">
								<font color="#000000"><b><?=$parse['case_pourcentage'] ?>%</b></font></div>
						</div>

						<? if ($this->config->game->get('noob', 0) == 1): ?>
							<div class="separator"></div>
							<img src="<?=$this->url->getBaseUri() ?>assets/images/warning.png" align="absmiddle" alt="">
							<span style="font-weight:normal;"><span class="positive">Активен режим ускорения новичков.</span><br>Режим будет деактивирован после достижения 1000 очков.</span>
						<? endif; ?>
					</div>
					<div class="col-md-2 col-sm-12 col-xs-7">
						<div class="row">
							<? foreach ($parse['officiers'] AS $oId => $oTime): ?>

									<div class="col-xs-3 col-sm-2 col-md-12">
										<a href="<?=$this->url->get("officier/") ?>" class="tooltip" data-content="<?=_getText('tech', $oId) ?><br><? if ($oTime > time()): ?>Нанят до <font color=lime><?=$this->game->datezone("d.m.Y H:i", $oTime) ?></font><? else: ?><font color=lime>Не нанят</font><? endif; ?>"><span class="officier of<?=$oId ?><?=($oTime > time() ? '_ikon' : '') ?>"></span></a>
									</div>

							<? endforeach; ?>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-4 col-xs-12">
				<div class="separator hidden-sm-up"></div>
				<div class="table container-fluid">
					<div class="row">
						<div class="col-xs-12 c">Диаметр</div>
					</div>
					<div class="row">
						<div class="col-xs-12 th"><?=\Xnova\Helpers::pretty_number($parse['planet_diameter']) ?> км</div>
					</div>
					<div class="row">
						<div class="col-xs-12 c">Занятость</div>
					</div>
					<div class="row">
						<div class="col-xs-12 th"><a title="Занятость полей"><?=$parse['planet_field_current'] ?></a> / <a title="Максимальное количество полей"><?=$parse['planet_field_max'] ?></a> поля</div>
					</div>
					<div class="row">
						<div class="col-xs-12 c">Температура</div>
					</div>
					<div class="row">
						<div class="col-xs-12 th">от. <?=$parse['planet_temp_min'] ?>&deg;C до <?=$parse['planet_temp_max'] ?>&deg;C</div>
					</div>
					<div class="row">
						<div class="col-xs-12 c">
							Обломки
							<? if ($parse['get_link']): ?>
								(<a href="#" onclick="QuickFleet(8, <?=$parse['galaxy_galaxy'] ?>, <?=$parse['galaxy_system'] ?>, <?=$parse['galaxy_planet'] ?>, 2)">переработать</a>)
							<? endif; ?>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 th doubleth middle">
							<div>
								<img src="<?=$this->url->getBaseUri() ?>assets/images/skin/s_metall.png" alt="" align="absmiddle" class="tooltip" data-content="Металл">
								<?=\Xnova\Helpers::pretty_number($parse['metal_debris']) ?>
								/
								<img src="<?=$this->url->getBaseUri() ?>assets/images/skin/s_kristall.png" alt="" align="absmiddle" class="tooltip" data-content="Кристалл">
								<?=\Xnova\Helpers::pretty_number($parse['crystal_debris']) ?>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 c">Бои</div>
					</div>
					<div class="row">
						<div class="col-xs-12 th middle">
							<img src="<?=$this->url->getBaseUri() ?>assets/images/wins.gif" alt="" align="absmiddle" class="tooltip" data-content="Победы">
							<?=$parse['raids_win'] ?>
							&nbsp;&nbsp;
							<img src="<?=$this->url->getBaseUri() ?>assets/images/losses.gif" alt="" align="absmiddle" class="tooltip" data-content="Поражения">
							<?=$parse['raids_lose'] ?>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 th">
							Фракция: <a href="<?=$this->url->get("race/") ?>"><?=$parse['race'] ?></a>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 th">
							<a href="<?=$this->url->get("refers/") ?>"><? if ($this->config->view->get('socialIframeView', 0)): ?>Рефералы<? else: ?>http://<?=$_SERVER['HTTP_HOST'] ?>/?<?=$parse['user_id'] ?><? endif; ?></a> [<?=$parse['links'] ?>]
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-4 col-xs-12">
				<div class="separator hidden-sm-up"></div>
				<div class="table container-fluid">
					<div class="row">
						<div class="c col-sm-5 col-xs-6">Игрок:</div>
						<div class="c col-sm-7 col-xs-6" style="word-break: break-all;"><a href="<?=$this->url->get("players/".$parse['user_id']."/") ?>" class="window popup-user"><?=$parse['user_username'] ?></a></div>
					</div>
					<div class="row">
						<div class="th col-sm-5 col-xs-6">Постройки:</div>
						<div class="th col-sm-7 col-xs-6"><span class="positive"><?=\Xnova\Helpers::pretty_number($parse['user_points']) ?></span></div>
					</div>
					<div class="row">
						<div class="th col-sm-5 col-xs-6">Флот:</div>
						<div class="th col-sm-7 col-xs-6"><span class="positive"><?=\Xnova\Helpers::pretty_number($parse['user_fleet']) ?></span></div>
					</div>
					<div class="row">
						<div class="th col-sm-5 col-xs-6">Оборона:</div>
						<div class="th col-sm-7 col-xs-6"><span class="positive"><?=\Xnova\Helpers::pretty_number($parse['user_defs']) ?></span></div>
					</div>
					<div class="row">
						<div class="th col-sm-5 col-xs-6">Наука:</div>
						<div class="th col-sm-7 col-xs-6"><span class="positive"><?=\Xnova\Helpers::pretty_number($parse['player_points_tech']) ?></span></div>
					</div>
					<div class="row">
						<div class="th col-sm-5 col-xs-6">Всего:</div>
						<div class="th col-sm-7 col-xs-6"><span class="positive"><?=\Xnova\Helpers::pretty_number($parse['total_points']) ?></span></div>
					</div>
					<div class="row">
						<div class="th col-sm-5 col-xs-6">Место:</div>
						<div class="th col-sm-7 col-xs-6"><a href="<?=$this->url->get("stat/players/range/".$parse['user_rank']."/") ?>"><?=$parse['user_rank'] ?></a> <span title="Изменение места в рейтинге">(<?=($parse['ile'] >= 1 ? '<span class="positive">+'.$parse['ile'].'</span>' : ($parse['ile'] < 0 ? '<span class="negative">'.$parse['ile'].'</span>' : '<font color="lightblue">'.$parse['ile'].'</font>')) ?>)</span></div>
					</div>
					<div class="row">
						<div class="c col-xs-12">Промышленный уровень</div>
					</div>
					<div class="row">
						<div class="th col-xs-12"><?=$parse['lvl_minier'] ?> из 100</div>
					</div>
					<div class="row">
						<div class="th col-xs-12"><?=\Xnova\Helpers::pretty_number($parse['xpminier']) ?> / <?=\Xnova\Helpers::pretty_number($parse['lvl_up_minier']) ?> exp</div>
					</div>
					<div class="row">
						<div class="c col-xs-12">Военный уровень</div>
					</div>
					<div class="row">
						<div class="th col-xs-12"><?=$parse['lvl_raid'] ?> из 100</div>
					</div>
					<div class="row">
						<div class="th col-xs-12"><?=\Xnova\Helpers::pretty_number($parse['xpraid']) ?> / <?=\Xnova\Helpers::pretty_number($parse['lvl_up_raid']) ?> exp</div>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<? if (isset($parse['build_list']) && is_array($parse['build_list']) && count($parse['build_list']) > 0): ?>
			<div class="separator"></div>
			<div class="table">
				<? foreach ($parse['build_list'] as $id => $list): ?>
					<div class="row flight">
						<div class="th col-xs-4 col-sm-1" <?=($id > 0 ? 'style="border-top:0;"' : '')?>>
							<div id="build<?=$id ?>" class="z"><?=($list[0] - time()) ?></div>
							<script type="text/javascript">FlotenTime('build<?=$id ?>', <?=($list[0] - time()) ?>);</script>
							<span class="positive hidden-sm-up"><?=$this->game->datezone("d.m H:i:s", $list[0]) ?></span>
						</div>
						<div class="th col-sm-11 col-xs-8 text-xs-left" style="<?=($id > 0 ? 'border-top:0;' : '')?>">
							<span class="pull-xs-left"><span class="flight owndeploy"><?=$list[1] ?></span></span>
							<span class="positive pull-xs-right hidden-xs-down"><?=$this->game->datezone("d.m H:i:s", $list[0]) ?></span>
						</div>
					</div>
				<? endforeach; ?>
			</div>
		<? endif; ?>
	</div>
</div>

<? if (isset($parse['activity'])): ?>
	<div class="separator"></div>

	<div id="tabs" class="ui-tabs ui-widget ui-widget-content" style="max-width: 100%">
		<div class="head">
			<ul class="ui-tabs-nav ui-widget-header">
				<li><a href="#tabs-0">Чат</a></li>
				<li><a href="#tabs-1">Форум</a></li>
			</ul>
		</div>
		<div id="tabs-0" class="ui-tabs-panel ui-widget-content">
			<table class="table" style="max-width: 100%">
				<tr>
					<th class="text-xs-left">
						<div style="overflow-y: auto;overflow-x: hidden;">
						<? foreach ($parse['activity']['chat'] AS $activity): ?>
							<div class="activity"><div class="date1" style="display: inline-block;padding-right:5px;"><?=$this->game->datezone("H:i", $activity['TIME']) ?></div><div style="display: inline;white-space:pre-wrap"><?=$activity['MESS'] ?></div></div>
							<div class="clear"></div>
						<? endforeach; ?>
						</div>
					</th>
				</tr>
			</table>
		</div>
		<div id="tabs-1" class="ui-tabs-panel ui-widget-content" style="display: none">
			<table class="table">
				<tr>
					<th class="text-xs-left">
						<div style="overflow-y: auto;overflow-x: hidden;">
						<? foreach ($parse['activity']['forum'] AS $activity): ?>
							<div class="activity"><div class="date1" style="display: inline-block;padding-right:5px;"><?=$this->game->datezone("H:i", $activity['TIME']) ?></div><div style="display: inline;white-space:pre-wrap"><?=$activity['MESS'] ?></div></div>
							<div class="clear"></div>
						<? endforeach; ?>
						</div>
					</th>
				</tr>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		$("#tabs").tabs();
	</script>
<? endif; ?>