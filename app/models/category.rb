class Category < ActiveRecord::Base
  has_many :products

  enum :code, [
    :food,
    :drink,
    :book,
    :keyboard,
    :mouse
  ]
end