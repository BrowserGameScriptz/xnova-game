<table width="519">
	<tr>
		<td class="c" colspan="2">Ваши заявки</td>
	</tr>
	{% for list in parse['list'] %}
	<tr>
		<th width="70%">{{ list[2] }} [{{ list[1] }}]</th>
		<th>{{ game.datezone("d.m.Y H:i", list[3]) }}</th>
	</tr>
	<tr>
		<th colspan="2">
			<router-form action="{{ url('alliance/') }}"><input type="hidden" name="r_id" value="{{ list[0] }}"><input type="submit" name="bcancel" value="Убрать заявку"></router-form>
		</th>
	</tr>
	{% endfor %}
</table>