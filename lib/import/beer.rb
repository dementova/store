module Import
	class Beer
		def self.process
			response = Request.process(IMPORT['products']['beers']['url'])

			ActiveRecord::Base.transaction do
				category = Category.create(name: 'Beer')

				data = response.map do |beer|

					{}.tab do |obj|
						obj[:name] 				= beer[:name]
						obj[:description] = beer[:description]
						obj[:price] 			= beer[:ibu]
						obj[:count] 			= beer[:ebc]
						obj[:category_id] = category.id
					end

				end

				Product.create(data)
			end
		end
	end
end