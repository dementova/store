class BasketController < ApplicationController
  def list
  	safe_action do
      @result = Operation::Basket::ListProduct.new(params).perform
  	end
  end

  def add
  	safe_action do
      @result = Operation::Basket::AddProduct.new(params).perform
  	end
  end

  def destroy
  	safe_action do
      @result = Operation::Basket::DestroyProduct.new(params).perform
  	end
  end
end