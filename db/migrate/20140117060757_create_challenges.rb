class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.float :cost_per_completion
      t.datetime :expiration
	  t.integer :cause_id
	  t.string :challenge_type
	  t.float :kilo_to_walk
	  t.float :kilo_to_run
	  t.integer :calories_to_burn
	  t.integer :user_id

      t.timestamps
    end
  end
end
