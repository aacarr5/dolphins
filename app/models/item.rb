class Item < ActiveRecord::Base
	belongs_to :pairing
	has_many :menus, :through => :pairing
	has_many :restaurants, :through => :menus
end