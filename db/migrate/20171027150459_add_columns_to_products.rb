class AddColumnsToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :ingredients, :string
    add_column :products, :ingredients_amount_per_recipe, :integer
    add_column :products, :amount_type, :string
    add_column :products, :ingredients_cost_per_unit, :integer
    add_column :products, :unit_type, :string
    add_column :products, :min_amount, :integer
    add_column :products, :product_price, :float
    add_column :products, :product_cost, :float
  end
end
