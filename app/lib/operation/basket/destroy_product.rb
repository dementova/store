module Operation
	module Basket
		class DestroyProduct < Base
		
			def process!
				basket.products.delete(product)
				
				basket.discount = Discount.define(basket.products)
				basket.cost 		= cost

				Result.with_success(basket)
			end

			private
			def product
				@product ||= Product.find(form[:product_id])
			end

			def basket
				@basket ||= ::Basket.find(user_id: user_id)
			form[:user_id]

		end
	end
end