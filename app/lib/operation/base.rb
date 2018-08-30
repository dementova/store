module Operation
	class Base
		attr_reader :params

		def initialize params
			@params = params
		end

		def perform
			with_validation do 
				process!
			end
		end

	  protected

		def with_validation
			p form, form.valid?, '='*100
			form.valid? or Error.new :incorrect_validation
		end

	  def form
	    @form ||= self.class.name.gsub('Operation', 'Validation').constantize.new(@params)
	  end
	end
end