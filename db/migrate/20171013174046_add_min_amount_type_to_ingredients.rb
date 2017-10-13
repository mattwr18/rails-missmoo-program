class AddMinAmountTypeToIngredients < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :min_amount_type, :string
  end
end
