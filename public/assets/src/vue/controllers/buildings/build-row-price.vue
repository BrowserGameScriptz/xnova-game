<template>
	<div v-if="resources" class="building-price">
		<div v-if="price.metal > 0" class="building-price-item">
			<img :src="$root.getUrl('assets/images/skin/s_metal.png')" align="absmiddle" class="tooltip" data-content="Металл">

			<span v-if="resources.metal.current >= price.metal" class="resYes">{{ price.metal|number }}</span>
			<span v-else="" class="resNo tooltip" :data-content="'Необходимо еще: '+$options.filters.number(price.metal - resources.metal.current)">{{ price.metal|number }}</span>
		</div>
		<div v-if="price.crystal > 0" class="building-price-item">
			<img :src="$root.getUrl('assets/images/skin/s_crystal.png')" align="absmiddle" class="tooltip" data-content="Кристалл">

			<span v-if="resources.crystal.current >= price.crystal" class="resYes">{{ price.crystal|number }}</span>
			<span v-else="" class="resNo tooltip" :data-content="'Необходимо еще: '+$options.filters.number(price.crystal - resources.crystal.current)">{{ price.crystal|number }}</span>
		</div>
		<div v-if="price.deuterium > 0" class="building-price-item">
			<img :src="$root.getUrl('assets/images/skin/s_deuterium.png')" align="absmiddle" class="tooltip" data-content="Дейтерий">

			<span v-if="resources.deuterium.current >= price.deuterium" class="resYes">{{ price.deuterium|number }}</span>
			<span v-else="" class="resNo tooltip" :data-content="'Необходимо еще: '+$options.filters.number(price.deuterium - resources.deuterium.current)">{{ price.deuterium|number }}</span>
		</div>
		<div v-if="price.energy > 0" class="building-price-item">
			<img :src="$root.getUrl('assets/images/skin/s_energy.png')" align="absmiddle" class="tooltip" data-content="Энергия">

			<span v-if="resources.energy.max >= price.energy" class="resYes">{{ price.energy|number }}</span>
			<span v-else="" class="resNo tooltip" :data-content="'Необходимо еще: '+$options.filters.number(price.energy - resources.energy.max)">{{ price.energy|number }}</span>
		</div>
	</div>
</template>

<script>
	export default {
		name: "build-row-price",
		props: ['price'],
		computed: {
			resources () {
				return this.$store.state.resources
			}
		}
	}
</script>