module Result
	module Base
		class Error
			include ActiveAttr::Model

			attribute :error, 		type: Boolean
			attribute :error_msg, type: String
			attribute :result
		end

		class Success
			include ActiveAttr::Model

			attribute :error, 		type: Boolean, default: false
			attribute :error_msg, type: String
			attribute :result
		end

		class Item
			include ActiveAttr::Model

			attribute :id, 				type: Integer
		end
	end
end