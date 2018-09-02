module Import
	class Beer
		def process!
			response = Request.process(IMPORT['products']['beers']['url'])

			ActiveRecord::Base.transaction do
				category = Category.find_or_create_by(name: 'Drink', code: :drink)

				data = response.map do |beer|
					data = {}.tap do |obj|
						obj[:name] 				= beer['name']
						obj[:description] = beer['description']
						obj[:color] 			= rand_color
						obj[:price] 			= beer['ibu']
						obj[:count] 			= beer['ebc']
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