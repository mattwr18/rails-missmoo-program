class ProductManager
  def initialize user, product, ingredient
    @user = user
    @product = product
    @ingredient = ingredient
  end

  def create_ingredients
    Ingredient.create(name: @product.ingredients, amount: 1, amount_type: @product.amount_type, min_amount: @product.min_amount, user_id: @user.id, min_amount_type: "kilos", product_id: @product.id)
  end

  #def create_recipes
  #  Recipe.create(ingredient_id: @ingredient.id, amount: @ingredient.amount, amount_type: @ingredient.amount_type, user_id: @user.id, product_id: @product.id)
  #end
end
