class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def safe_action
    yield
    raise StandartError.new(@operation.error_msg) if @operation.error 

    @result = @operation.result
    respond_to do |format|
      format.html
      format.json { render json: @result.to_json }
    end
  rescue Exception => e
    p '*'*100
    puts e.message
    puts e.backtrace
    p '*'*100
  end
end
