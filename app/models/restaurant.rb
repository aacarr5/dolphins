class Restaurant < ActiveRecord::Base
	has_many :menus
	has_many :pairings, :through => :menus
	has_many :items, :through => :pairings
end