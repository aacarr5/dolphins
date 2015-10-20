require_relative 'item'
require 'pry'

class Menu

	attr_reader :goal
	attr_accessor :items, :combinations, :solutions

	def initialize(goal,items)
		@goal = goal
		@items = items
		@combinations = []
		@solutions = recursive_select_price
		# possible_combinations
		# final_solutions
	end


	def recursive_select_price(bill = [],remainder = @goal)

		if remainder == 0
			return bill
		end

		next_purchases = possible_choices(remainder)

		return false if next_purchases.empty?

		winning_billzz = []

		next_purchases.each do |item|
			new_remainder = remainder
			item_bill = bill.map(&:dup)
			item_bill << item
			new_remainder-=item.price
			if (result = recursive_select_price(item_bill,new_remainder)) 
				winning_billzz << result.flatten unless combo_matcher(winning_billzz,result)
			end
		end

		return winning_billzz
	end

	def combo_matcher(winning_billzz,result)
		bill_to_s(winning_billzz).any?{|bill| bill == result_to_s(result)}
	end

	def result_to_s(result)
		# result.to_s
	end

	def bill_to_s(bill)
		bill.map{|item| item.name}.sort.join
	end

	def possible_choices(remainder)
		@items.select{|item| item.price <= remainder }
	end

	def select_price(price)
		solution = combinations.select{|combo| find_total(combo) == price}
		if solution.empty? 
			puts "Womp. Try a different combo!"
		else
			solution.each {|sol| print_list(sol)}
		end
	end

	def final_solutions
		@combinations.select{|combo| find_total(combo) == @goal}.each {|solution| @solutions << solution}
	end

	def print_list(solution)
		puts "Here's a solution!" 
		solution.flatten.each do |item|
			puts "#{item.name}: #{item.price}"
		end
	end

	def find_total(list)
		sum = 0.0
		list.each {|item| sum+=item.price}
		sum
	end

	def print_solutions
		@solutions.each do |sol|
			puts "here's a solution"
			sol.each {|item| puts "#{item.name}: #{item.price}"}
		end
	end


end

item1 = Item.new("orange",20)
item2 = Item.new("banana",20)
item3 = Item.new("chicken",7)
item4 = Item.new("carrot",3)

menu = Menu.new(10,[item1,item2,item3,item4])

menu.recursive_select_price
p menu.solutions
