module DiscountFactory
	class Group

		attr_reader :discount

		def initialize products
			@products = products
		end

		def define
			exist? ? Discount::CONFIG['discount_amount']['group'] : 0
		end

		private

		def exist?
		end

		def amount_products
		end

	end
end