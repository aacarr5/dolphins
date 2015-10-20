require_relative 'menu'
require_relative 'menu_controller'

include MenuController

goal = 0
items = []

File.open(ARGV[0],'r').each do |line|
	if line.include?(",")
		# binding.pry
		items << MenuController::make_item(line)
	else
		goal+= MenuController::make_goal(line)
	end
end

menu = Menu.new(goal,items)

menu.print_solutions


