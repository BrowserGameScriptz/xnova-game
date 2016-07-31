<table class="table">
	<tr>
		<td class="b" colspan="2">Версия сервера: <strong><?=$parse['adm_ov_data_yourv'] ?></strong></td>
	</tr>
</table>

<div class="table-responsive">
	<table class="table table-striped table-hover table-advance">
		<thead>
			<tr>
				<th width="30"><a href="<?=$this->url->get('admin/overview/cmd/sort/type/id/') ?>">&nbsp;</a></th>
				<th><a href="<?=$this->url->get('admin/overview/cmd/sort/type/username/') ?>">Логин игрока</a></th>
				<th><a href="<?=$this->url->get('admin/overview/cmd/sort/type/ip/') ?>">IP</a></th>
				<th><a href="<?=$this->url->get('admin/overview/cmd/sort/type/ally_name/') ?>">Альянс</a></th>
				<th><a href="<?=$this->url->get('admin/overview/cmd/sort/type/onlinetime/') ?>">Активность</a></th>
			</tr>
		</thead>
		<? foreach ($parse['adm_ov_data_table'] AS $list): ?>
			<tr>
				<td><a href="<?=$this->url->get('messages/write/'.$list['adm_ov_data_id'].'/') ?>"><span class="fa fa-envelope-o"></span></a></td>
				<td><a href="<?=$this->url->get('admin/manager/data/username/'.$list['adm_ov_data_id'].'/send/') ?>"><?=$list['adm_ov_data_name'] ?></a></td>
				<td><a style="color:<?=$list['adm_ov_data_clip'] ?>;" href="http://network-tools.com/default.asp?prog=trace&host=<?=$list['adm_ov_data_adip'] ?>"><?=$list['adm_ov_data_adip'] ?></a></td>
				<td><?=$list['adm_ov_data_ally'] ?></td>
				<td><?=$list['adm_ov_data_activ'] ?></td>
			</tr>
		<? endforeach; ?>
	</table>
</div>
<div class="row">
	<div class="col-md-5 col-sm-12">
		Игроков в сети: <?=$parse['adm_ov_data_count'] ?>
	</div>
</div>