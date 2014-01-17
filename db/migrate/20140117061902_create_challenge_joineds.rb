class CreateChallengeJoineds < ActiveRecord::Migration
  def change
    create_table :challenge_joineds do |t|
      t.float :kilo_walked
      t.float :kilo_ran
      t.integer :challenge_id

      t.timestamps
    end
  end
end
