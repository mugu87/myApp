# == Schema Information
#
# Table name: challenges
#
#  id                  :integer          not null, primary key
#  cost_per_completion :float
#  expiration          :datetime
#  cause_id            :integer
#  created_at          :datetime
#  updated_at          :datetime
#

class Challenge < ActiveRecord::Base
	has_many :challenge_supporters
	has_many :challenge_joineds
	belongs_to :cause
end
