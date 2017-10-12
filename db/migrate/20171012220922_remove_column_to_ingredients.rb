class RemoveColumnToIngredients < ActiveRecord::Migration[5.1]
  def change
    remove_column :ingredients, :product_id, :integer
  end
end
