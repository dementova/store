module Import
	class Book
		def process!
			response = Request.process(IMPORT['products']['books']['url'])

			ActiveRecord::Base.transaction do
				category = Category.find_or_create_by(name: 'Book', code: :book)

				data = response['entries'].map do |book|
					data = {}.tap do |obj|
						obj[:name] 				= book['name']
						obj[:color] 			= rand_color
						obj[:price] 			= book['seed_count']
						obj[:count] 			= book['edition_count']
						obj[:category_id] = category.id
					end

					Validation::Product::Create.new(data).valid? or next

					data
				end.compact

				Product.create(data)
			end
		end

		private
		def rand_color
			CONFIG['colors'][ rand(CONFIG['colors'].count-1) ]
		end		
	end
end