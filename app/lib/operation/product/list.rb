module Operation
	module Product
		class List < Base
			def process!
				Product.where(@params).to_a
			end
		end
	end
end