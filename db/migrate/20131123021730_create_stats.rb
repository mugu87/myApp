class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :user_id
	  t.integer :step_count_walking
	  t.integer :step_count_running
	  t.integer :seconds_walking
	  t.integer :seconds_running
	  t.float :kilometers_walking
	  t.float :kilometers_running
	  t.integer :calories_burned_walking
	  t.integer :calories_burned_running
	  t.string :data_source
	  t.date :stat_date

      t.timestamps
    end
  end
end
