class ProductManager
  def initialize user, product
    @user = user
    @product = product
  end

  def create_ingredients
    Ingredient.create(name: @product.ingredients, amount: 1, amount_type: @product.amount_type, min_amount: @product.min_amount, user_id: @user.id, min_amount_type: "kilos")
  end
end
