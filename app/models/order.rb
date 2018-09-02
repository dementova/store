class Order < ActiveRecord::Base
  has_many :order_products
  has_many :products, through: :order_products
  has_many :payments_transactions

  enum status: [
    :created,
    :in_processing,
    :paid,
    :canceled_by_user,
    :canceled_by_system,
  ]
end