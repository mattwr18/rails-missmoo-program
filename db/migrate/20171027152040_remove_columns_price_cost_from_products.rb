class RemoveColumnsPriceCostFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :price, :float
    remove_column :products, :cost, :float
  end
end
