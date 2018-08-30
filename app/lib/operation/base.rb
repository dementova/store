module Operation
	class Base
		attr_reader :params

		def initialize params
			@params = params
		end

		def perform
			validation
			process!
		end

	  protected
		def validation
			form && form.valid? or Error.new :incorrect_validation
		end

	  def form
	    @form ||= self.class.name.gsub('Operation', 'Validation').constantize.new(@params)
	  end
	end
end