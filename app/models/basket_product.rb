class BasketProduct < ActiveRecord::Base
  belongs_to :basket
  belongs_to :product
end