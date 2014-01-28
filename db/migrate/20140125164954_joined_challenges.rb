class JoinedChallenges < ActiveRecord::Migration
  def change
	  create_table :joined_challenges do |t|
      t.float :kilo_walked
      t.float :kilo_ran
      t.integer :challenge_id
	  t.integer :user_id
	  t.float :kilos_had_ran_on_join_date
	  t.float :kilos_had_walked_on_join_date
	  t.boolean :active

      t.timestamps
    end

  end
end
