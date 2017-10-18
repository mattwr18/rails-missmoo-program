class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.integer :product_id
      t.integer :ingredient_id
      t.integer :amount
      t.string :amount_type

      t.timestamps
    end
  end
end
