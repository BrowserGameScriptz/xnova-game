<table class="table" style="table-layout: fixed;">
	<tr>
		<td class="c" colspan="2">Информация об альянсе</td>
	</tr>
	{% if parse['image'] != '' %}
		<tr><th colspan="2" class="p-a-0"><img src="{{ parse['image'] }}" style="max-width:100%"></th></tr>
	{% endif %}
	<tr>
		<th>Аббревиатура</th>
		<th>{{ parse['tag'] }}</th>
	</tr>
	<tr>
		<th>Название</th>
		<th>{{ parse['name'] }}</th>
	</tr>
	<tr>
		<th>Члены альянса</th>
		<th>
			{{ parse['members'] }}
			{% if parse['members_list'] %}
				(<router-link to="{{ url('alliance/members/') }}">список</router-link>)
			{% endif %}
		</th>
	</tr>
	<tr>
		<th>Ваш ранг</th>
		<th>
			{{ parse['range'] }}
			{% if parse['alliance_admin'] %}
				(<router-link to="{{ url('alliance/admin/edit/ally/') }}">управление альянсом</router-link>)
			{% endif %}
		</th>
	</tr>
	{% if parse['diplomacy'] is defined and parse['diplomacy'] !== false %}
		<tr>
			<th>Дипломатия</th>
			<th>
				<router-link to="{{ url('alliance/diplomacy/') }}">Просмотр</router-link>{% if parse['diplomacy'] > 0 %} ({{ parse['diplomacy'] }} новых запросов){% endif %}
			</th>
		</tr>
	{% endif %}
	{% if parse['requests'] %}
		<tr><th>Заявки</th><th><router-link to="{{ url('alliance/admin/edit/requests/') }}">{{ parse['requests'] }} заявок</router-link></th></tr>
	{% endif %}
	{% if parse['chat_access'] %}
		<tr><th>Альянс чат ({{ user.messages_ally }} новых)</th><th><router-link to="{{ url('alliance/chat/') }}">Войти в чат</router-link></th></tr>
	{% endif %}
	<tr>
		<td class="b" colspan="2" height="100" style="padding:3px;">
			<text-viewer text="{{ parse['description'] }}"></text-viewer>
		</td>
	</tr>
	{% if parse['web'] %}
		<tr>
			<th>Домашняя страница</th>
			<th><a href="{{ parse['web'] }}" target="_blank">{{ parse['web'] }}</a></th>
		</tr>
	{% endif %}
	<tr>
		<td class="c" colspan="2">Внутренняя компетенция</td>
	</tr>
	<tr>
		<td class="b" colspan="2" height="100" style="padding:3px;">
			<text-viewer text="{{ parse['text'] }}"></text-viewer>
		</td>
	</tr>
	{% if parse['owner'] != '' %}
	<tr>
		<td colspan="2">
			{{ parse['owner'] }}
		</td>
	</tr>
	{% endif %}
</table>