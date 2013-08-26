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
		intersectionSet = Set.new
		set.values.each do |elem|
			if @values.include? elem
				intersectionSet.values << elem
			end
		end
		intersectionSet.values
	end

	def unite set
		unionSet = Set.new
		@values.each do |i|
			unionSet.values << i
		end
		set.values.each do |j|
			unless unionSet.values.include? j
				unionSet.values << j
			end
		end
		unionSet.values
	end

	def toss set
		diffSet = Set.new
		@values.each do |x|
			diffSet.values << x
		end

		set.values.each do |elem|
			if diffSet.values.include? elem
				diffSet.values.delete(elem)
			end
		end
		diffSet.values
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