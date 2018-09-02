module Validation
	module Basket
		# class List < Base
	 #    attribute :user_id,	 		type: Integer
		# end

		class AddProduct < Base
	    attribute :user_id,			type: Integer
	    attribute :product_id,	type: Integer
		end

		class DestroyProduct < Base
	    attribute :user_id,			type: Integer
	    attribute :product_id,	type: Integer
		end
	end
end