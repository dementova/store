module Validation
	module Product
		class List < Base
	    attribute :price, 	 type: Float
	    attribute :type, 		 type: String
	    attribute :sort, 		 type: String,  defaut: :name
      attribute :sort_by,  type: String,  defaut: :asc
	    attribute :offset,   type: Integer, defaut: :asc
		end
	end
end