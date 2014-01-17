# == Schema Information
#
# Table name: challenge_supporters
#
#  id           :integer          not null, primary key
#  challenge_id :integer
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class ChallengeSupporter < ActiveRecord::Base
	belongs_to :challenge
	belongs_to :user
end
