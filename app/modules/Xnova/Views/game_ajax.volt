<? if (isset($topPanel) && $topPanel == true): ?>
	<? $this->partial('shared/panel'); ?>
<? endif; ?>

<? if (isset($deleteUserTimer) && $deleteUserTimer > 0): ?>
	<table class="table"><tr><td class="c" align="center">Включен режим удаления профиля!<br>Ваш аккаунт будет удалён после <?=$this->game->datezone("d.m.Y", $deleteUserTimer) ?> в <?=$this->game->datezone("H:i:s", $deleteUserTimer) ?>. Выключить режим удаления можно в настройках игры.</td></tr></table><div class="separator"></div>
<? endif; ?>

<? if (isset($vocationTimer) && $vocationTimer > 0): ?>
   <table class="table"><tr><td class="c negative" align="center">Включен режим отпуска! Функциональность игры ограничена.</td></tr></table><div class="separator"></div>
<? endif; ?>

<? if (isset($globalMessage) && $globalMessage != ''): ?>
   <table class="table"><tr><td class="c" align="center"><?=$globalMessage ?></td></tr></table><div class="separator"></div>
<? endif; ?>

<div class="content-row">
	<?

	$messages = $this->flashSession->getMessages();

	if (count($messages))
	{
		foreach ($messages as $type => $items)
		{
			foreach ($items as $message)
			{
				if ($type == 'alert')
					echo '<script>$(document).ready(function(){alert("'.$message.'");});</script>';
				else
				{
					echo $message;
				}
			}
		}
	}

	?>
	{{ content() }}
</div>

<? if ($userId > 0 && !$isPopup): ?>
	<? $this->view->partial('shared/planets_ajax'); ?>
<? endif; ?>

<? if (!$isPopup): ?>
	<script>document.title = "<?=str_replace("\n", "", $this->tag->getTitle(false)) ?>";</script>
<? endif; ?>

<? if ($this->game->checkSaveState()): ?>
	<script>addHistoryState("<?=$this->game->getClearQuery() ?>")</script>
<? endif; ?>

<? if (!$isPopup): ?>
	<script type="text/javascript">
		setMenuItem("<?=($this->dispatcher->getControllerName().($this->dispatcher->getControllerName() == 'buildings' ? $this->dispatcher->getActionName() : '')) ?>");
	</script>
<? endif; ?>

<? if ($userId > 0): ?>
	<script type="text/javascript">UpdateGameInfo('<?=$messages ?>', '<?=$messages_ally ?>'); <? if (!$isPopup): ?>timestamp = <?=time() ?>;<? endif; ?></script>
<? endif; ?>