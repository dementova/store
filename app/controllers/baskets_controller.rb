class BasketsController < ApplicationController
  def add
    safe_action do
      @operation = Operation::Basket::AddProduct.new(params).perform
  	end
  end

  def destroy
  	safe_action do
      @operation = Operation::Basket::DestroyProduct.new(params).perform
  	end
  end
end