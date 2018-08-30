class PaymentTransaction < ActiveRecord::Base
  belongs_to :order

  enum :status, [
    :success,
    :failed
  ]
end