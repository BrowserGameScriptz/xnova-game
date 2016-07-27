<script type="text/javascript">
	var ress = [{{ planet['metal'] }}, {{ planet['crystal'] }}, {{ planet['deuterium'] }}];
	var max = [{{ planet['metal_m'] }},{{ planet['crystal_m'] }},{{ planet['deuterium_m'] }}];
	var production = [{{ planet['metal_ph'] / 3600 }}, {{ planet['crystal_ph'] / 3600 }}, {{ planet['deuterium_ph'] / 3600 }}];
	timeouts['res_count'] = window.setInterval(XNova.updateResources, 1000);
	var serverTime = {{ planet['time'] }}000 - Djs + (timezone + {{ date("Z") / 1800 }}) * 1800000;
</script>
<div class="row topnav">
	{% if config.view.get('showPlanetListSelect', 0) == 1 %}
		<div class="col-md-2 hidden-xs-down col-sm-12">
			<div class="separator hidden-md-up"></div>
			<select style="width:100%;" onChange="load(this.options[this.selectedIndex].value);" title="">{{ planet['planetlist'] }}</select>
			<div class="separator hidden-md-up"></div>
		</div>
	{% endif %}
	<div class="col-md-{{ config.view.get('showPlanetListSelect', 0) == 1 ? '5' : '6' }} col-sm-6 col-xs-12">
		<div class="row">
			<div class="col-xs-4 text-xs-center">
				<span onclick="showWindow('{{ _text('tech', 1) }}', '{{ url('info/1/') }}', 600)" class="tooltip hidden-xs-down" data-content='<table width=150><tr><td width=30%>КПД:</td><td align=right>{{ planet['metal_mp'] }}%</td></tr><tr><td>В час:</td><td align=right>{{ pretty_number(planet['metal_ph']) }}</td></tr><tr><td>День:</td><td align=right>{{ pretty_number(planet['metal_ph'] * 24) }}</td></tr></table>'><span class="sprite skin_metall"></span><br></span>
				<div class="neutral">Металл</div>
				<div title="Количество ресурса на планете"><div id="met">-</div></div>
				<span title="Максимальная вместимость хранилищ" class="hidden-xs-down">{{ planet['metal_max'] }}</span>
			</div>
			<div class="col-xs-4 text-xs-center">
				<span onclick="showWindow('{{ _text('tech', 2) }}', '{{ url('info/2/') }}', 600)" class="tooltip hidden-xs-down" data-content='<table width=150><tr><td width=30%>КПД:</td><td align=right>{{ planet['crystal_mp'] }}%</td></tr><tr><td>В час:</td><td align=right>{{ pretty_number(planet['crystal_ph']) }}</td></tr><tr><td>День:</td><td align=right>{{ pretty_number(planet['crystal_ph'] * 24) }}</td></tr></table>'><span class="sprite skin_kristall"></span><br></span>
				<div class="neutral">Кристалл</div>
				<div title="Количество ресурса на планете"><div id="cry">-</div></div>
				<span title="Максимальная вместимость хранилищ" class="hidden-xs-down">{{ planet['crystal_max'] }}</span>
			</div>
			<div class="col-xs-4 text-xs-center">
				<span onclick="showWindow('{{ _text('tech', 3) }}', '{{ url('info/3/') }}', 600)" class="tooltip hidden-xs-down" data-content='<table width=150><tr><td width=30%>КПД:</td><td align=right>{{ planet['deuterium_mp'] }}%</td></tr><tr><td>В час:</td><td align=right>{{ pretty_number(planet['deuterium_ph']) }}</td></tr><tr><td>День:</td><td align=right>{{ pretty_number(planet['deuterium_ph'] * 24) }}</td></tr></table>'><span class="sprite skin_deuterium"></span><br></span>
				<div class="neutral">Дейтерий</div>
				<div title="Количество ресурса на планете"><div id="deu">-</div></div>
				<span title="Максимальная вместимость хранилищ" class="hidden-xs-down">{{ planet['deuterium_max'] }}</span>
			</div>
		</div>
	</div>
	<div class="col-md-{{ config.view.get('showPlanetListSelect', 0) == 1 ? '5' : '6' }} col-sm-6 col-xs-12">
		<div class="row">
			<div class="col-xs-4 text-xs-center">
				<span onclick="showWindow('{{ _text('tech', 4) }}', '{{ url('info/4/') }}', 600)" title="{{ _text('tech', 4) }}" class="hidden-xs-down"><span class="sprite skin_energie"></span><br></span>
				<div class="neutral">Энергия</div>
				<div title="Энергетический баланс">{{ planet['energy_total'] }}</div>
				<span title="Выработка энергии" class="hidden-xs-down positive">{{ planet['energy_max'] }}</span>
			</div>
			<div class="col-xs-4 text-xs-center">
				<span class="tooltip hidden-xs-down" data-content='<center>Вместимость:<br>{{ planet['ak'] }}</center>'>
					{% if planet['energy_ak'] > 0 and planet['energy_ak'] < 100 %}
						<img src="{{ url.getBaseUri() }}assets/images/batt.php?p={{ planet['energy_ak'] }}" width="42" alt="">
					{% else %}
						<span class="sprite skin_batt{{ planet['energy_ak'] }}"></span>
					{% endif %}
					<br>
				</span>
				<div class="neutral">Аккумулятор</div>
				{{ planet['energy_ak'] }}%<br>
			</div>
			<div class="col-xs-4 text-xs-center">
				<a href="{{ url('credits/') }}" class="tooltip hidden-xs-down" data-content='
				<table width=550>
				<tr>
				{% for oId, oTime in planet['officiers'] %}
					<td align="center" width="14%">
						{{ _text('tech', oId) }}
						<div class="separator"></div>
						<span class="officier of{{ oId }}{{ oTime > time() ? '_ikon' : '' }}"></span>
					</td>
				{% endfor %}
				</tr>
				<tr>
				{% for oId, oTime in planet['officiers'] %}
					<td align="center">
					{% if oTime > time() %}
						Нанят до <font color=lime>{{ game.datezone("d.m.Y H:i", oTime) }}</font>
					{% else %}
						<font color=lime>Не нанят</font>
					{% endif %}
					</td>
				{% endfor %}
				</tr></table>'><span class="sprite skin_kredits"></span><br></a>
				<div class="neutral">Кредиты</div>
				{{ planet['credits'] }}<br>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$("#met").html(XNova.format({{ planet['metal'] }}));
	$("#cry").html(XNova.format({{ planet['crystal'] }}));
	$("#deu").html(XNova.format({{ planet['deuterium'] }}));
	$(document).ready(XNova.updateResources());
</script>