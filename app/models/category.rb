class Category < ActiveRecord::Base
  has_many :products

  enum :product_type, [
    :food,
    :book,
    :electronics
  ]
end