require_relative 'item'

class Menu

	attr_reader :goal, :items

	def initialize(goal,items)
		@goal = goal
		@items = items
	end

	def possible_combinations
		arrangements = []
		[*1..items.length].each do |idx|
			arrangements << items.combination(idx) 
		end
		arrangements.uniq
	end

	def select_price(price)
		combinations = possible_combinations
		combinations.select{|combo| find_total(combo) == price}
	end

	def find_total(list)
		sum = 0
		list.each {|item| sum+=item.price}
		sum
	end




end