<form action="<?=$this->url->get('alliance/apply/allyid/'.$parse['allyid'].'/') ?>" method="POST">
	<table class="table">
		<? if ($parse['text_apply'] != ''): ?>
		<tr>
			<td class="c" colspan="2">Приветствие альянса</td>
		</tr>
		<tr>
			<td class="b" colspan="2" height="100" style="padding:3px;"><span id="m1"></span></td>
		</tr>
		<? endif; ?>
		<tr>
			<td class="c" colspan="2">Написать запрос на вступление в альянс [<?=$parse['tag'] ?>]</td>
		</tr>
		<tr>
			<th><textarea name="text" cols=40 rows=10 title=""></textarea></th>
		</tr>
		<tr>
			<th colspan="2"><input type="submit" name="further" value="Отправить"></th>
		</tr>
	</table>
</form>
<script>Text('<?=str_replace(["\r\n", "\n", "\r"], '', stripslashes($parse['text_apply'])) ?>', 'm1');</script>