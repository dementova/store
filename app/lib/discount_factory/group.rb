module DiscountFactory
	class Group

		attr_reader :discount

		def initialize products
			@products = products
		end

		def define
			Discount::CONFIG['groups'].sum do |group|
				common = @categories & group
				common.count == group.count ? Discount::CONFIG['discount_amount']['group'] : 0
			end
		end

		private

		def categories
			@categories ||= @products.map{ |p| p.category.code.to_s }
		end


	end
end