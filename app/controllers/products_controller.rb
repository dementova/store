class ProductsController < ApplicationController
  def list
  	safe_action do
      @operation = Operation::Product::List.new(params).perform
  	end
  end

  def show
  	safe_action do
  		@operation = Operation::Product::Show.new(params).perform
  	end
  end
end