class Category < ActiveRecord::Base
  has_many :products

  enum :code, [
    :food,
    :book,
    :electronics
  ]
end