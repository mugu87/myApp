# == Schema Information
#
# Table name: challenges
#
#  id                  :integer          not null, primary key
#  cost_per_completion :float
#  expiration          :datetime
#  cause_id            :integer
#  challenge_type      :string(255)
#  kilos_to_walk       :float
#  kilos_to_run        :float
#  calories_to_burn    :integer
#  user_id             :integer
#  created_at          :datetime
#  updated_at          :datetime
#

class Challenge < ActiveRecord::Base
	#has_many :joined_challenges
	has_many :solos
	has_many :groups
	belongs_to :cause
	belongs_to :user

	after_initialize :init

	def init
		self.kilos_to_walk ||= 0.0 #will set the default value only if it's nil
		self.kilos_to_run ||= 0.0 #will set the default value only if it's nil
		self.calories_to_burn ||= 0 #will set the default value only if it's nil
	end


end
