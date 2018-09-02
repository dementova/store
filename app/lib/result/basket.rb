module Result
	module Basket
		class Item < Result::Base::Item
			include ActiveAttr::Additions

			attribute :discount, 		type: Float
			attribute :currency, 		type: String
			attribute :cost, 				type: Float

			nested_attribute :products
		end
	end
end