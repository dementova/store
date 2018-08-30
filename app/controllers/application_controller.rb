class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  def safe_action
    yield
    respond_to do |format|
    	format.html
    	format.json @result.to_json
    end
  rescue Exception => e
    p '*'*100
    p e.message
    # p e.backtrace
    p '*'*100
  ensure
  	@result
  end
end
