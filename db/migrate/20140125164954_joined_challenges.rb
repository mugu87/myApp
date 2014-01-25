class JoinedChallenges < ActiveRecord::Migration
  def change
	  create_table :joined_challenges do |t|
      t.float :kilo_walked
      t.float :kilo_ran
      t.integer :challenge_id
	  t.integer :user_id

      t.timestamps
    end

  end
end
