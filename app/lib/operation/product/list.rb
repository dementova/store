module Operation
	module Product
		class List < Base
			def process!
byebug
				Product.where(conditions).order(sort : sort_by).to_a
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
		end
	end
end