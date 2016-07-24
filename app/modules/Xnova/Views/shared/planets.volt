<? if (count($planet['list'])): ?>
	<a href="#" class="planet-toggle hidden-sm-up"><span>
			<span class="first"></span>
			<span class="second"></span>
			<span class="third"></span>
		</span>
	</a>
		<div class="planet-sidebar planetList">
			<div class="list ">
				<? foreach ($planet['list'] AS $i => $item): ?>
					<div class="planet type_<?=$item['planet_type'] ?> <?=($planet['current'] == $item['id'] ? 'current' : '') ?>">
						<a href="javascript:" onclick="changePlanet(<?=$item['id'] ?>)" title="<?=$item['name'] ?>">
							<img src="<?=$this->url->getBaseUri() ?>assets/images/planeten/small/s_<?=$item['image'] ?>.jpg" height="40" width="40" alt="<?=$item['name'] ?>">
						</a>
						<span class="hidden-md-up"><?=\Xnova\Helpers::BuildPlanetAdressLink($item) ?></span>
						<div class="hidden-sm-down">
							<?=$item['name'] ?>
							<br>
							<?=\Xnova\Helpers::BuildPlanetAdressLink($item) ?>
						</div>
						<div class="clear"></div>
					</div>
				<? endforeach; ?>
				<div class="clearfix"></div>
			</div>
		</div>
	<? if ($ajaxNavigation != 0): ?>
		<script type="text/javascript">
			$(document).ready(function()
			{
				$('.planetList .list').on('mouseup', 'a', function()
				{
					$('.planetList .planet').removeClass('current');
					$(this).parents('.planet').addClass('current');
				});
			});
		</script>
	<? endif; ?>
<? endif; ?>