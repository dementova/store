module DiscountFactory
	class Color

		attr_reader :discount

		def initialize products
			@products = products
		end

		def define
			exist? ? Discount::CONFIG['discount_amount']['color'] : 0
		end

		private

		def exist?
			amount_products >= Discount::CONFIG['amount_products']['by_color']
		end

		def amount_products
			@amount_products ||= @products.count{|p| p.color == Discount::CONFIG['color'] }
		end

	end
end