<table class="table">
	<tr>
		<td class="c" colspan="10">Список членов альянса (количество: {{ parse['i'] }})</td>
	</tr>
	<tr>
		<th>№</th>
		<th><a href="{{ url('alliance/'~(parse['admin'] ? 'admin/edit/members' : 'members')~'/sort1/1/sort2/'~parse['s']~'/') }}">Ник</a></th>
		<th>&nbsp;</th>
		<th>&nbsp;</th>
		<th><a href="{{ url('alliance/'~(parse['admin'] ? 'admin/edit/members' : 'members')~'/sort1/2/sort2/'~parse['s']~'/') }}">Ранг</a></th>
		<th><a href="{{ url('alliance/'~(parse['admin'] ? 'admin/edit=members' : 'members')~'/sort1/3/sort2/'~parse['s']~'/') }}">Очки</a></th>
		<th>Координаты</th>
		<th><a href="{{ url('alliance/'~(parse['admin'] ? 'admin/edit/members' : 'members')~'/sort1/4/sort2/'~parse['s']~'/') }}">Дата вступления</a></th>
		{% if parse['status'] %}<th><a href="{{ url('alliance/'~(parse['admin'] ? 'admin/edit/members' : 'members')~'/sort1/5/sort2/'~parse['s']~'/') }}">Активность</a></th>{% endif %}
		{% if parse['admin'] %}<th>Управление</th>{% endif %}
	</tr>
	{% for m in parse['memberslist'] %}
		{% if m['Rank_for'] is not defined or parse['admin'] is false %}
			<tr>
				<th>{{ m['i'] }}</th>
				<th>{{ m['username'] }}</th>
				<th><popup-link to="/messages/write/{{ m['id'] }}/" title="{{ m['username'] }}: отправить сообщение" :width="680"><span class='sprite skin_m'></span></popup-link></th>
				<th><img src="{{ url.getBaseUri() }}assets/images/skin/race{{ m['race'] }}.gif" width="16" height="16"></th>
				<th>{{ m['range'] }}</th>
				<th>{{ m['points'] }}</th>
				<th><a href="{{ url('galaxy/'~m['galaxy']~'/'~m['system']~'/') }}">{{ m['galaxy'] }}:{{ m['system'] }}:{{ m['planet'] }}</a></th>
				<th>{{ m['time'] }}</th>
				{% if parse['status'] %}<th>{{ m['onlinetime'] }}</th>{% endif %}
				{% if parse['admin'] %}<th><a href="{{ url('alliance/admin/edit/members/kick/'~m['id']~'/') }}" onclick="return confirm('Вы действительно хотите исключить данного игрока из альянса?');"><img src="{{ url.getBaseUri() }}assets/images/abort.gif"></a>&nbsp;<a href="{{ url('alliance/admin/edit/members/rank/'~m['id']~'/') }}"><img src="{{ url.getBaseUri() }}assets/images/key.gif"></a></th>{% endif %}
			</tr>
		{% else %}
			<tr>
				<td colspan="10">
					<form action="{{ url('alliance/admin/edit/members/id/'~m['id']~'/') }}" method="POST">
						<table class="table">
							<tr>
								<th colspan="7">{{ m['Rank_for'] }}</th>
								<th><select name="newrang" title="">{{ m['options'] }}</select></th>
								<th colspan="2"><input type="submit" value="Сохранить"></th>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		{% endif %}
	{% endfor %}
	<tr>
		<td class="c" colspan="10"><a href="{{ url('alliance'~(parse['admin'] ? '/admin/edit/ally' : '')~'/') }}">{{ _text('xnova', 'Return_to_overview') }}</a></td>
	</tr>
</table>
