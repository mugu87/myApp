class RemoveTransactionFromCalories < ActiveRecord::Migration
  def change
    remove_column :calories, :transaction
    add_column :calories, :trans, :integer
  end
end
