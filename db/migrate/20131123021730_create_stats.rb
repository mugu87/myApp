class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :today_active_calories
      t.integer :user_id

      t.timestamps
    end
  end
end
