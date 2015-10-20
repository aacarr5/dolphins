require 'pry'

module MenuController

	def make_goal(line)
		line[1..-1].to_f
	end

	def make_item(line)
		line = line.gsub(/[\\\"\n\$]/,"")
		line = line.split(",")
		Item.new(line[0],line[1].to_f)
	end




end