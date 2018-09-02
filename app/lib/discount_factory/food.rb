module DiscountFactory
	class Food

		attr_reader :discount

		def initialize products
			@products = products
		end

		def define
			exist? ? Discount::CONFIG['discount_amount']['food'] : 0
		end

		private

		def exist?
			return false if Time.now.hour < Discount::CONFIG['food']['time_limit']
			
			amount_products >= Discount::CONFIG['amount_products']['by_food']
		end

		def amount_products
			@amount_products ||= @products.count { |p| p.category.food? }
		end

	end
end