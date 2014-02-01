class CreateJoinedSoloChallenges < ActiveRecord::Migration
	def change
		create_table :joined_solo_challenges do |t|
			t.float :kilos_walked
			t.float :kilos_ran
			t.integer :calories_burned
			t.integer :challenge_id
			t.integer :user_id
			t.float :kilos_had_ran_on_join_date
			t.float :kilos_had_walked_on_join_date
			t.boolean :active
			t.boolean :finished



			t.timestamps
		end
	end
end
