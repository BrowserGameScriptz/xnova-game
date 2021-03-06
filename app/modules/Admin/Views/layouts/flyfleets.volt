<div class="card">
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>Состав флота</th>
					<th>Задание</th>
					<th>Владелец</th>
					<th>Планета-дом</th>
					<th>Время отправления</th>
					<th>Игрок-цель</th>
					<th>Планета-цель</th>
					<th>Время на орбите</th>
					<th>Время прибытия</th>
				</tr>
			</thead>
			{% for parse in flt_table %}
				<tr>
					<td>{{ parse['Id'] }}</td>
					<td>{{ parse['Fleet'] }}</td>
					<td>{{ parse['Mission'] }}</td>
					<td>{{ parse['St_Owner'] }}</td>
					<td>{{ parse['St_Posit'] }}</td>
					<td>{{ parse['St_Time'] }}</td>
					<td>{{ parse['En_Owner'] }}</td>
					<td>{{ parse['En_Posit'] }}</td>
					<td>{{ parse['St_Time'] }}</td>
					<td>{{ parse['En_Time'] }}</td>
				</tr>
			{% endfor %}
		</table>
	</div>
</div>