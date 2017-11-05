class DropJoinTableProductsIngredients < ActiveRecord::Migration[5.1]
  def change
    drop_join_table :products, :ingredients do |t|
      # t.index [:product_id, :ingredient_id]
      # t.index [:ingredient_id, :product_id]
    end
  end
end
