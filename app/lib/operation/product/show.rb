module Operation
	module Product
		class Show < Base
		
			def process!
				response = ::Product.find(form[:id])
				
				Result.with_success(response)
			end

		end
	end
end