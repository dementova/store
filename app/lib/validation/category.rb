module Validation
	module Category
		class Create < Base
	    attribute :name, 		type: String
	    attribute :code, 		type: Integer

			validates :name, :code, presence: true
		end
	end
end