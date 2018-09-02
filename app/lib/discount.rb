class Discount

	CONFIG = YAML.load_file(File.join(Rails.root, "config", "discount.yml")) || {}

	TYPE = {
		color: 	'DiscountFactory::Color',
		gorup: 	'DiscountFactory::Group',
		food: 	'DiscountFactory::Food'
	}.freeze

	def self.define products

		TYPE.sum do |type, klass|
			TYPE[type].constantize.new(products).define
		end

	end

end