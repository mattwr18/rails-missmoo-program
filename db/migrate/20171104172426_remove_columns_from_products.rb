class RemoveColumnsFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :ingredients, :string
    remove_column :products, :ingredients_amount_per_recipe, :integer
    remove_column :products, :amount_type, :string
    remove_column :products, :ingredients_cost_per_unit, :integer
    remove_column :products, :unit_type, :string
    remove_column :products, :min_amount, :integer
    remove_column :products, :product_price, :float
    remove_column :products, :product_cost, :float
  end
end
