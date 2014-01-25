# == Schema Information
#
# Table name: joined_challenges
#
#  id           :integer          not null, primary key
#  kilo_walked  :float
#  kilo_ran     :float
#  challenge_id :integer
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class JoinedChallenge < ActiveRecord::Base
	belongs_to :challenge
	belongs_to :user
end
