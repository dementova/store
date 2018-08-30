class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  def safe_action
    yield
    respond_to do |format|
    	format.html
    	format.json @result.to_json
    end
  rescue Exception => e
  	# Error.new e.message
  ensure
  	@result
  end
end
