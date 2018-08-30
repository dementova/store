class Result
  attr_reader :error, :error_msg

  def self.with_error error, data = nil
    new.tap do |obj|
      obj.error     = true
      obj.error_msg = I18n.t("errors.#{error}")
      obj.result    = data
    end
  end

  def self.with_success data
    new.tap do |obj|
      obj.result = data
    end
  end

  def self.product_list items
    new.tap do |obj|
      obj.items = items.map{|item| Decorator::Product.new(item) }
    end
  end

  def self.product item
    new.tap do |obj|
      obj.item = Decorator::Product.new(item)
    end
  end
end