module Operation
	module Product
		class List < Base
			LIMIT = CONFIG['per_page']
			
			def process!
				response = ::Product.includes(:category).where(conditions).order(sort => sort_by).offset(offset).limit(LIMIT).to_a

				Result::Base::Success.new(
					result: response.map(&:to_struct)
				)
			end

			private
			def conditions
				{}.tap do
					# conditions[:category_id] = form[:caregory_id]
				end
			end

			def sort
				form[:sort]
			end

			def sort_by
				form[:sort_by]
			end

			def offset
				form[:offset]
			end
			
		end
	end
end