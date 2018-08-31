module Operation
	module Product
		class Show < Base
		
			def process!
				response = Product.find(form[:id])
				
				Result.product(response)
			end

		end
	end
end