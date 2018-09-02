module Result
	module Product
		class Item < Result::Base::Item
			attribute :name, 					type: String
			attribute :price, 				type: Float
			attribute :color, 				type: String
			attribute :count, 				type: Integer
			attribute :category_name, type: String
		end
	end
end