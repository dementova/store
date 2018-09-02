class Basket < ActiveRecord::Base
	# belongs_to :user
  has_many :basket_products
  has_many :products, through: :basket_products

  delegate :name, to: :user, prefix: true, allow_nil: true

  structurize 'Result::Basket::Item'
end