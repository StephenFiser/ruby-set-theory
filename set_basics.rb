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
		@values.each do |elem| 
			unionSet.values << elem
		end
		set.values.each do |i|
			unless unionSet.values.include? i
				unionSet.values << i
			end
			unionSet.values.sort!
		end
		unionSet
	end

	def complement set
		compSet = Set.new
		set.values.each do |elem|
			compSet.values << elem
		end
		@values.each do |elem|
			if compSet.values.include? elem
				compSet.values.delete(elem)
			end
		end
		compSet
	end

	def toss(set, universalSet) 

		# A set difference is mathematically defined as A intersect ( B complement )
		universal = Set.new
		tossSet = Set.new

		@values.each do |elem|
			tossSet.values << elem
		end

		universalSet.values.each do |elem|
			universal.values << elem
		end

		tossSet.intersect(set.complement(universal))
	end
end
