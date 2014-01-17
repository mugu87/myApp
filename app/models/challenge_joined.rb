# == Schema Information
#
# Table name: challenge_joineds
#
#  id           :integer          not null, primary key
#  kilo_walked  :float
#  kilo_ran     :float
#  challenge_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class ChallengeJoined < ActiveRecord::Base
	belongs_to :challenge
	has_many :users
end
