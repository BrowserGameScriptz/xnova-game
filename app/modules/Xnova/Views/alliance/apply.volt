<router-form action="{{ url('alliance/apply/allyid/'~parse['allyid']~'/') }}">
	<table class="table">
		{% if parse['text_apply'] != '' %}
			<tr>
				<td class="c" colspan="2">Приветствие альянса</td>
			</tr>
			<tr>
				<td class="b" colspan="2" height="100" style="padding:3px;">
					<text-viewer text="{{ parse['text_apply'] }}"></text-viewer>
				</td>
			</tr>
		{% endif %}
		<tr>
			<td class="c" colspan="2">Написать запрос на вступление в альянс [{{ parse['tag'] }}]</td>
		</tr>
		<tr>
			<th><textarea name="text" cols=40 rows=10 title=""></textarea></th>
		</tr>
		<tr>
			<th colspan="2"><input type="submit" name="further" value="Отправить"></th>
		</tr>
	</table>
</router-form>