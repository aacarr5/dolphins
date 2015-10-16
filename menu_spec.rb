require 'rspec'
require_relative 'menu'

describe 'the full menu class' do

	let (:item1) {Item.new("orange",5)}
	let (:item2) {Item.new("banana",3)}
	let (:item3) {Item.new("chicken",9)}
	let (:item4) {Item.new("carrot",1)}
	
	let (:menu) {Menu.new(10,[item1,item2,item3,item4])}

	it 'should have a #select_price method that works' do 
		expect(menu.possible_combinations.length).to eq(26)
	end

	it 'should have a #find_total method that works' do 
		expect(menu.find_total([item1,item2])).to eq(8)
	end


	

end