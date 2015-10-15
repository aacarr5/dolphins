class Menu < ActiveRecord::Base
	belongs_to :restaurant
	has_many :pairings
	has_many :items, :through => :pairings
end