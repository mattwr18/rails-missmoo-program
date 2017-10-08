class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :amount
      t.float :price
      t.float :cost

      t.timestamps
    end
  end
end
