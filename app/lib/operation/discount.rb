module Operation
	class Discount < Base

		def process!
			
		end

		private

		def food?
			form[:product_type] == :food
		end
	
	end
end