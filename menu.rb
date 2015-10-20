require_relative 'item'
require 'pry'

class Menu

	attr_reader :goal
	attr_accessor :items, :combinations, :solutions

	def initialize(goal,items)
		@goal = goal
		@items = items
		@solutions = recursive_select_price
	end


	def recursive_select_price(bill = [],remainder = @goal)
		next_purchases = possible_choices(remainder)

		return bill if remainder == 0
		return false if next_purchases.empty?

		winning_billzz = []

		next_purchases.each do |item|
			new_remainder = remainder
			item_bill = bill.map(&:dup)
			item_bill << item
			new_remainder-=item.price
			if (result = recursive_select_price(item_bill,new_remainder)) 
				winning_billzz << result.flatten unless combo_matcher(winning_billzz,result.flatten)
			end
		end

		return winning_billzz
	end

	def combo_matcher(existing_solutions,result)
		return false if existing_solutions.empty?

		sorted_billzz = solutions_to_s(existing_solutions)
		result_as_string = result_to_s(result)
		sorted_billzz.any? {|bill| bill == result_as_string}
	end
	
	def solutions_to_s(menu_possibilities)
		menu_possibilities.map{|sol| result_to_s(sol)}
	end

	def result_to_s(menu_selection)
		menu_selection.map{|item| item.name}.sort.join
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


