class Product < ActiveRecord::Base
  belongs_to :category
  has_many :order_products
  has_many :basket_products
  has_many :orders, through: :order_products
  has_many :products, through: :basket_products

	delegate :name, to: :category, prefix: true, allow_nil: true

	structurize 'Result::Product::Item'
end