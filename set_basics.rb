module SetBasics
	def intersect set
		intersectionSet = Set.new
		set.values.each do |elem|
			if @values.include? elem
				intersectionSet.values << elem
			end
		end
		intersectionSet
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
		unionSet
	end

	def complement set
		compSet = set
		@values.each do |elem|
			if compSet.values.include? elem
				compSet.values.delete(elem)
			end
		end
		compSet
	end

	def toss set 
		tossSet = Set.new
		@values.each do |elem|
			tossSet.values << elem
		end
		universal = Set.new(1,2,3,4,5,6,7,8,9,10)
		tossSet.intersect(set.complement(universal))
	end
end