@user = User.create(email: "test@test.com",
                    password: "asdfasdf",
                    password_confirmation: "asdfasdf",
                    first_name: "Brienne",
                    last_name: "Tully",
                    username: "BrienneOfTarth")
puts "1 user created"

@product = Product.create(name: "Peanut milk", amount: 1, price: 4, cost: 1, user_id: @user.id)
@product = Product.create(name: "Almond milk", amount: 1, price: 9, cost: 4.5, user_id: @user.id)
@product = Product.create(name: "Coconut milk", amount: 1, price: 7, cost: 3, user_id: @user.id)

puts '3 products created'

@ingredient = Ingredient.create(name: "Peanuts", amount: 1, amount_type: "kilos", min_amount: 150, min_amount_type: "grams", user_id: @user.id)
@ingredient = Ingredient.create(name: "Almonds", amount: 1, amount_type: "kilos", min_amount: 150, min_amount_type: "grams", user_id: @user.id)
@ingredient = Ingredient.create(name: "Coconuts", amount: 1, amount_type: "kilos", min_amount: 150, min_amount_type: "grams", user_id: @user.id)

puts '3 ingredients created'
