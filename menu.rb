require_relative 'item'

class Menu

	attr_reader :goal
	attr_accessor :items, :solutions

	def initialize(goal,items)
		@goal = goal
		@items = items
		@solutions = find_solutions
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
				result.first.class == Array ? winning_billzz.concat(result) : winning_billzz << result
			end
		end

		return winning_billzz.delete_if{|sol| sol.empty?}
	end

	def find_solutions
		possibilities = recursive_select_price
		possibilities.delete_if do |menu| 
			solutions_to_s(possibilities).count(result_to_s(menu)) >=2
		end
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

	def print_solutions
		puts "Here are the solutions for a goal of $#{"%.2f" %goal}" 
		solutions.each_with_index do |solution,idx|
			puts "Solution #{idx+1}:"
			solution.each {|item| print "#{item.name} ($#{"%.2f" %item.price}) "}
			puts
		end
	end


end


