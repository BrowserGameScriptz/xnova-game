<table class="table">
	<tr>
		<td class="c"><h1>Сохранение боевого доклада</h1></td>
	</tr>
	<tr>
		<th>
			<form action="{{ url('log/new/') }}" method="POST">
				Название:<br>
				<input type="text" name="title" size="50" maxlength="100" title=""><br>
				ID боевого доклада:<br>
				<input type="text" name="code" size="50" maxlength="40" value="{{ request.getQuery('save', 'string', '') }}" title="">
				<br>
				<br><input type="submit" value="Сохранить">
			</form>
		</th>
	</tr>
</table>