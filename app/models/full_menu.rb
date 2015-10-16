class FullMenu

	attr_reader :goal

	def initialize(goal,*items)
		@goal = goal
		@items = item_creator(items)
	end

	def item_creator(items)
		array = items.clone
		item_array = []
		while (array.lenght > 0)
			item_array << Item.new(name:array.first,price:array.second)
			2.times {array.shift}
		end
		item_array
	end


end