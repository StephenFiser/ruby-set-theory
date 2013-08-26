class Set
	attr_accessor :values

	def initialize *args
		@values = []
		args.each do |arg|
			unless @values.include? arg
				@values << arg
			end
		end
	end

	def intersect set
		intersectionSet = []
		set.values.each do |elem|
			if @values.include? elem
				intersectionSet << elem
			end
		end
		intersectionSet
	end

	def unite set
		unionSet = []
		@values.each do |i|
			unionSet << i
		end
		set.values.each do |j|
			unless unionSet.include? j
				unionSet << j
			end
		end
		unionSet
	end

	def toss set
		diffSet = @values
		set.values.each do |elem|
			if diffSet.include? elem
				diffSet.delete(elem)
			end
		end
		diffSet
	end

	def complement set
		compSet = set.values
		@values.each do |elem|
			if compSet.include? elem
				compSet.delete(elem)
			end
		end
		compSet
	end

end