module Decorator
  class Product
    attr_reader :product

    def initialize product
      @product = product
    end

    def discount
    end

    def amount
      # product.cost - discount
    end
  end
end