module Operation
	module Basket
		class AddProduct < Base
		
			def process!
				basket.tap do |obj|
					obj.products << product
					
					obj.discount 	= Discount.define(basket.products)
					obj.currency 	= CONFIG['currency']
					obj.cost 			= cost
				end.save

				Result::Base::Success.new(
					result: basket.to_struct
				)
			end

			private

			def user_id
				1 #form[:user_id]
			end

			def product
				@product ||= ::Product.find(form[:product_id])
			end

			def basket
				@basket ||= ::Basket.includes(products: :category).find_or_create_by(user_id: user_id)
			end

			def cost
				basket.products.sum(&:price)
			end

		end
	end
end