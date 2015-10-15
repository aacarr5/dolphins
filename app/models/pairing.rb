class Pairing < ActiveRecord::Base
	belongs_to :menu
	belongs_to :item
	has_one :restaurant, :through => :menu
end