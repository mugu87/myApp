class CreateCalories < ActiveRecord::Migration
  def change
    create_table :calories do |t|
      t.integer :user_id
      t.integer :transaction

      t.timestamps
    end
  end
end
