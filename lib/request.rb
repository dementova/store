class Request
	def self.process api_url, params={}, format=:json
    new(params, api_url, format).execute
	end

	def initialize params, api_url, format
		@params = params
		@api_url = api_url
		@format = format
	end

	def execute
    send_request
    parse_response
	end

	private
  def send_request
    url = "#{@api_url}#{@action}"     
    @response = RestClient::Request.execute(
      method:       :get, 
      url:          url, 
      timeout:      IMPORT[:timeout], 
      open_timeout: IMPORT[:timeout], 
      headers:      { accept: @format, params: @params }
    )
  end

  def parse_response
  	JSON.parse( @response.body )
  end

end