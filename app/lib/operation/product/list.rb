module Operation
	module Product
		class List < Base
			LIMIT = 10
			
			def process!
				response = Product.where(conditions).order(sort : sort_by).offset(offset).limit(LIMIT).to_a
				
				Result.product_list(response)
			end

			private
			def conditions
				{}.tap do
					# conditions[:type] = form[:type]
				end
			end

			def sort
				form[:sort]
			end

			def sort_by
				form[:sort_by]
			end

			def offset
				form[:offset] || 0
			end
			
		end
	end
end