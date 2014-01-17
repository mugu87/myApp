class AddChallengeRelationshipsToUser < ActiveRecord::Migration
  def change
	  add_column :users, :challenge_joined_id, :integer
  end
end
