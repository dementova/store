module Validation
	module Basket
		class List < Base
	    attribute :user_id,	 		type: Integer
		end

		class Add < Base
	    attribute :user_id,			type: Integer
	    attribute :product_id,	type: Integer
		end

		class Destroy < Base
	    attribute :user_id,			type: Integer
	    attribute :product_id,	type: Integer
		end
	end
end