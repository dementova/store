module Operation
	module Basket
		class ListProduct < Base
		
			def process!
				response = basket.products
				Result.product_list(response)
			end

			private
			def user_id
				form[:user_id]
			end

			def basket
				@basket ||= Basket.find_or_create_by(user_id: user_id)
			end

		end
	end
end