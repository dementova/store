class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :discount
  has_many :orders
end