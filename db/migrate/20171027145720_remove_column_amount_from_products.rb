class RemoveColumnAmountFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :amount, :integer
  end
end
