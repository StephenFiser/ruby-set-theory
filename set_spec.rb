
require './set'

describe Set, "#initialize" do
  it "should create a set from args" do
    set = Set.new(1,2,3)
    set.values.should eq([1,2,3])
  end

  it "should not allow duplicates" do
  	set = Set.new(1,2,3,3)
  	set.values.should eq([1,2,3])
  end
end

describe Set, "#intersect" do
	it "should return the values from the intersection" do
		set1 = Set.new(1,2,3)
		set2 = Set.new(3,4,5)
		set1.intersect(set2).values.should eq([3])
	end

	it "should allow multiple calculations" do
		set1 = Set.new(1,2,3)
		set2 = Set.new(3,4,5)
		set1.intersect(set2)
		set2.intersect(set1).values.should eq ([3])
	end
end

describe Set, "#unite" do
	it "should return the values from the union" do
		set1 = Set.new(1,2,3)
		set2 = Set.new(3,4,5)
		set1.unite(set2).values.should eq ([1,2,3,4,5])
	end

	it "should allow multiple calculations" do
		set1 = Set.new(1,2,3)
		set2 = Set.new(3,4,5)
		set1.unite(set2)
		set2.unite(set1).values.should eq ([1,2,3,4,5])
	end

	it "should sort the results of the union" do
		set1 = Set.new(1,2,3)
		set2 = Set.new(3,4,5)
		set2.unite(set1).values.should eq ([1,2,3,4,5])
	end
end

describe Set, "#toss" do
	it "should return the result of the set difference" do
		set1 = Set.new(1,2,3)
		set2 = Set.new(2,3,4)
		universal = Set.new(1,2,3,4)
		set1.toss(set2, universal).values.should eq([1])
	end

	it "should allow for multiple calculations" do
		set1 = Set.new(1,2,3)
		set2 = Set.new(2,3,4)
		universal = Set.new(1,2,3,4)
		first = set1.toss(set2, universal)
		second = set2.toss(set1, universal)
		second.values.should eq([4])
	end

end

describe Set, "#complement" do
	it "should return the complement of the set" do
		universal = Set.new(1,2,3,4,5,6,7,8,9,10)
		set = Set.new(1,2,5)
		set.complement(universal).values.should eq([3,4,6,7,8,9,10])
	end
end




