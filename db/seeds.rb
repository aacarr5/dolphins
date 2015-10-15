# require 'faker'

first = Restaurant.create!(name: Faker::Company.name)

second = Restaurant.create!(name: Faker::Company.name)

restaurant_array = [first,second]

food = []

10.times {food << Item.create!(name:Faker::Commerce.color, price: Faker::Commerce.price)}

4.times do
	restaurant = restaurant_array.sample

	menu = Menu.create!(name:Faker::Address.city,restaurant_id:restaurant.id)

	10.times do
		Pairing.create!(menu_id: menu.id,item_id: food.sample.id)
	end

end