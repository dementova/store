module Operation
	module Basket
		class AddProduct < Base
		
			def process!
				basket.product_ids << product_id
				
				Result.with_success(basket)
			end

			private
			def user_id
				form[:user_id]
			end

			def product_id
				form[:product_id]
			end

			def basket
				@basket ||= Basket.find_or_create_by(user_id: user_id)
			end

		end
	end
end