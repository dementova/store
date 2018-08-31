class Basket < ActiveRecord::Base
  belongs_to :user
  has_many :products

  delegate :name, to: :user, prefix: true, allow_nil: true
end