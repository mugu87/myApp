class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.float :cost_per_completion
      t.datetime :expiration
	  t.integer :cause_id

      t.timestamps
    end
  end
end
