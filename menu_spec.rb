require 'rspec'
require_relative 'menu'

describe 'the full menu class' do

	let (:item1) {Item.new("orange",5)}
	let (:item2) {Item.new("banana",3)}
	let (:item3) {Item.new("chicken",9)}
	let (:item4) {Item.new("carrot",1)}
	
	let (:menu) {Menu.new(10,[item1,item2,item3,item4])}

	it 'should have all its possible combinations' do
		expect(menu.combinations.length).to eq(15)
	end

	it 'should have a #find_total method that works' do 
		expect(menu.find_total([item1,item2])).to eq(8)
	end

	it 'should message when price combos is not possible with #select_price' do 
		expect{menu.select_price(90)}.to output("Womp. Try a different combo!\n").to_stdout
	end

	it 'should return the combo if the possible is right with #select_price' do 
		expect{menu.select_price(8)}.to output("Here's a solution!\norange: 5\nbanana: 3\n").to_stdout
	end


	

end