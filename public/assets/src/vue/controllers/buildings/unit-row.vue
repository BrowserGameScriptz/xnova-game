<template>
	<div class="col-md-6 col-12">
		<div class="page-building-items-item building" :class="{blocked: !item.allow}">
			<div class="building-info">
				<div class="building-info-img">
					<popup-link :to="'/info/'+this.item['i']+'/'">
						<img :src="$root.getUrl('assets/images/gebaeude/'+item.i+'.gif')" :alt="$root.getLang('TECH', item.i)" align="top" class="tooltip img-fluid" :data-content="$root.getLang('TECH', item.i)" data-width="150">
					</popup-link>
				</div>

				<div class="building-info-actions">
					<div class="building-title">
						<router-link :to="'/info/'+item.i+'/'">
							{{ $root.getLang('TECH', item.i) }}
						</router-link>
						<span :class="{positive: item.count > 0, negative: item.count === 0}">{{ item.count|number }}</span>
					</div>

					<div class="building-info-info" v-if="item.allow">
						<div class="building-info-time">
							<svg class="icon">
								<use xlink:href="#icon-time"></use>
							</svg>
							{{ item.time|time }}
						</div>

						<div v-html="item.effects"></div>

						<div v-if="item['is_max']">
							<center><font color="red">Вы можете построить только {{ item.max }} постройку данного типа</font></center>
						</div>
						<div v-else-if="max > 0" class="buildmax">
							<a @click.prevent="setMax">
								max: <font color="lime">{{ max|number }}</font>
							</a>
							<input type="number" min="0" :max="max" :name="'fmenge['+item.i+']'" :alt="item.name" v-model="count" style="width: 80px" maxlength="5" value="" placeholder="0">
						</div>
					</div>
					<div v-else="" class="building-required">
						<div v-html="item['need']"></div>
					</div>
				</div>
			</div>
			<build-row-price :price="item.price"></build-row-price>
		</div>
	</div>
</template>

<script>
	import BuildRowPrice from './build-row-price.vue'

	export default {
		name: "unit-row",
		props: ['item'],
		data ()
		{
			return {
				count: ''
			}
		},
		computed: {
			max ()
			{
				let max = -1;

				let resources = Object.keys(this.$root.getLang('RESOURCES'));

				resources.forEach((item) =>
				{
					let count = Math.floor(this.$store.state.resources[item]['current'] / this.item['price'][item]);

					if (max < 0)
						max = count;
					else if (max > count)
						max = count;
				});

				if (this.item['max'] > 0 && this.item['max'] < max)
					max = this.item['max'];

				return max;
			}
		},
		components: {
			BuildRowPrice
		},
		methods: {
			setMax ()
			{
				if (this.count === '' || parseInt(this.count) === 0)
					this.count = this.max;
				else
					this.count = '';
			}
		}
	}
</script>