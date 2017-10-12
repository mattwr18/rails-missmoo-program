class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :amount
      t.string :amount_type
      t.integer :min_amount

      t.timestamps
    end
  end
end
