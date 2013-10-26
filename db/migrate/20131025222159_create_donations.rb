class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :npo_id
      t.integer :user_id
      t.float :amount_donated
      t.integer :calories_donated

      t.timestamps
    end
  end
end
