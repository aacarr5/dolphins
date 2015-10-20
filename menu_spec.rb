require 'rspec'
require_relative 'menu'

describe 'the full menu class' do

	let (:item1) {Item.new("orange",5)}
	let (:item2) {Item.new("banana",3)}
	let (:item3) {Item.new("chicken",9)}
	let (:item4) {Item.new("carrot",1)}
	
	let (:menu) {Menu.new(10,[item1,item2,item3,item4])}


	it 'should have a #combo_matcher that checks if solution already exists' do 
	end

	it 'should have a #result_to_s that converst a sol to a unique string' do 
		expect(menu.result_to_s([item1,item2])).to eq("bananaorange")
	end

	it 'should have a #solutions_to_s that takes multiple solutions and creates unique strings' do 
		expect(menu.solutions_to_s([[item1,item2],[item3,item4]])).to eq(["bananaorange","carrotchicken"])
	end

	it 'should have a #combo_matcher that tells if bill exists already' do 
		solved = [[item1,item2],[item3,item1]]
		solution = [item2,item1]
		expect(menu.combo_matcher(solved,solution)).to eq(true)
	end
	

end