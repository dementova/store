module Import
	class Book
		def self.process
			response = Request.process(IMPORT['products']['books']['url'])

			ActiveRecord::Base.transaction do
				category = Category.create(name: 'Book')

				data = response['entries'].map do |book|

					{}.tab do |obj|
						obj[:name] 				= book[:name]
						obj[:price] 			= book[:seed_count]
						obj[:count] 			= book[:edition_count]
						obj[:category_id] = category.id
					end

				end

				Product.create(data)
			end
		end
	end
end