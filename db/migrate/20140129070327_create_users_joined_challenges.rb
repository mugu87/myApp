class CreateUsersJoinedChallenges < ActiveRecord::Migration
	def change
		create_table :joined_challenges_users, :id => false do |t|
			t.integer :user_id
			t.integer :joined_challenge_id
		end

		#add_index :users_joined_challenges, [:user_id, :joined_challenge_id]
	end
end
