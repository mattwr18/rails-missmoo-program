class AddUserIdColumnToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :user_id, :bigint
  end
end
