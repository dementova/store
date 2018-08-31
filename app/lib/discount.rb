class Discount

	CONFIG = YAML.load_file(File.join(Rails.root, "config", "discount.yml")) || {}

	TYPE = {
		color: 	'DiscountFactory::Color',
		gorup: 	'DiscountFactory::Group',
		food: 	'DiscountFactory::Food'
	}.freeze

	def self.define params

		discount = 0
		TYPE.each do |type, klass|
			discount += TYPE[:type].constantize.new(params).define
		end

	end

end