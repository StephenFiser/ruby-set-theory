require "./set_basics"

class Set
	include SetBasics
	attr_accessor :values

	def initialize *args
		@values = []
		args.each do |arg|
			unless @values.include? arg
				@values << arg
			end
		end
	end
end