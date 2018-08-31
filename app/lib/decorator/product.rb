module Decorator
  class Product
    attr_reader :product

    def initialize product
      @product = product
    end

    def amount
      product.cost - product.discount
    end
  end
end