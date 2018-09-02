'use strict';

var getQueryParams = function(params){
	return Object.keys(params).map(key => key + '=' + params[key]).join('&');
};

new Vue({
  el: '#products',
  data: function(){ 
  	return { 
  		products: [],
  		basket: { products: [], cost: 0, currency: 'USD', discount: 0 },
  		headers1: ['','Name', 'Price', 'Type','Color'],
  		headers2: ['','Name', 'Price']
  	}
  },
  computed:{
  	items: function(){
  		return this.products;
  	},
  	baskets: function(){
  		return this.basket;
  	},
  	totalPrice: function(){
  		return {
  			cost: 		this.basket.cost, 
  			discount: this.basket.discount, 
  			currency: this.basket.currency
  		}
  	}
  },
  created: function(){
		fetch('/products/list.json')
		  .then(function(response) {
		  	return response.json();
		  }).then((products) => {
		  	this.products = products;
		  }).catch((error) => { console.log('Ups: '+error) } );
  },
  methods: {
  	add: function(data){
  		let params = getQueryParams(data);

			fetch('/baskets/add.json?'+params)
			  .then(function(response) {
			  	return response.json();
			  }).then((basket) => {
			  	this.basket = basket;
			  }).catch((error) => { console.log('Ups: '+error) } );
  	}
  }
});

Vue.component('container', {
	props: ['headers'],
  template: "<section><table><tr><th v-for = 'item in headers'>{{ item }}</th></tr> <slot></slot> </table></section>"
});

Vue.component('price', {
  props: ['price'],
  template: "<p><b>Total: {{ price.cost }} {{ price.currency }}</b><br><b>Discount: - {{ price.discount }} {{ price.currency }}</b></p>"
});

Vue.component('product', {
  props: ['product', 'index'],
  template: '<tr><td>{{ index+1 }}. </td><td> {{ product.name }} </td><td> {{ product.category_name }} </td><td> {{ product.color }} </td><td> {{ product.price }}UAH </td><td><button @click="add(product.id)"> Add </button></td></tr>',
  methods: {
  	add: function(id){
  		this.$emit('basket-add', { product_id: id });
  	}
  }
});

Vue.component('basket-item', {
  props: ['product', 'index'],
  template: '<tr><td>{{ index+1 }}. </td><td>{{ product.name }}</td><td>{{ product.price }}</td><td></td></tr>'
});