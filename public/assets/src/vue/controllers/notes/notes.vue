<template>
	<div v-if="page" class="block page-notes">
		<div class="title">
			Заметки
		</div>
		<div class="content">
			<router-form action="/notes/">
				<div class="table">
					<div class="row">
						<div class="col-1 c"></div>
						<div class="col-3 c">Дата</div>
						<div class="col-8 c">Тема</div>
					</div>
					<div class="row" v-for="item in page['items']">
						<div class="col-1 th">
							<input name="delete[]" :value="item['id']" v-model="deleteItems" type="checkbox">
						</div>
						<div class="col-3 th">
							{{ item['time'] }}
						</div>
						<div class="col-8 th">
							<router-link :to="'/notes/edit/'+item['id']+'/'">
								<span :style="'color:'+item['color']">{{ item['title'] }}</span>
							</router-link>
						</div>
					</div>
					<div class="row" v-if="page['items'].length === 0">
						<div class="th col-12">Заметки отсутствуют</div>
					</div>
				</div>
				<div class="separator"></div>
				<div class="text-right">
					<input v-if="deleteItems.length > 0" class="negative" value="Удалить выбранное" type="submit">
					<router-link class="button" to="/notes/new/">Создать новую заметку</router-link>
				</div>
			</router-form>
		</div>
	</div>
</template>

<script>
	import router from 'router-mixin'

	export default {
		name: "notes",
		mixins: [router],
		data () {
			return {
				deleteItems: []
			}
		}
	}
</script>