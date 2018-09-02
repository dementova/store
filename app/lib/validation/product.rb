module Validation
	module Product
		class List < Base
	    attribute :price, 	 type: Float
	    attribute :type, 		 type: String
	    attribute :sort, 		 type: String,  default: :name
      attribute :sort_by,  type: String,  default: :asc
	    attribute :offset,   type: Integer, default: 0
		end

		class Show < Base
	    attribute :id, 	 		 type: Integer
		end

		class Create < Base
	    attribute :name, 	 				type: String
	    attribute :price, 				type: Float
	    attribute :count, 				type: Integer
	    attribute :category_id, 	type: String
			
			validates :name, :category_id, presence: true
		end

		class Item < Base
	    attribute :id, 	 						type: Integer
	    attribute :name, 	 					type: Integer
	    attribute :color, 	 				type: Integer
	    attribute :price, 	 				type: Integer
	    attribute :count, 	 				type: Integer
	    attribute :category_name, 	type: Integer
		end
	end
end