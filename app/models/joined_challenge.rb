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

	#get the lastest status of this joined challenge
	def get_lastest_chal_status
		lastest = {:kilos_ran_since_joined => 0.0, :kilos_walked_since_joined => 0.0, :calories_burned_since_joined => 0}
		current_date = self.created_at.to_date
		while(current_date <= Date.today)
			stat = Stat.where("stat_date = ?", current_date)[0]
			lastest[:kilos_ran_since_joined] = lastest[:kilos_ran_since_joined] + stat.kilometers_running
			lastest[:kilos_walked_since_joined] = lastest[:kilos_walked_since_joined] + stat.kilometers_walking
			current_date = current_date.next
		end
		lastest[:kilos_ran_since_joined] =  lastest[:kilos_ran_since_joined] - self.kilos_had_ran_on_join_date
		lastest[:kilos_walked_since_joined] =  lastest[:kilos_walked_since_joined] - self.kilos_had_walked_on_join_date

		return lastest	

	end

#
#	def kilos_ran_since_joined
#		result = 0.0
#		current_date = self.created_at.to_date
#		while(current_date <= Date.today)
#			stat = Stat.where("stat_date = ?", current_date)[0]
#			result = result + stat.kilometers_running
#			current_date = current_date.next
#		end
#		result = result - self.kilos_had_ran_on_join_date
#		return result
#	end
#
#	def kilos_walked_since_joined
#		result = 0.0
#		current_date = self.created_at.to_date
#		while(current_date <= Date.today)
#			stat = Stat.where("stat_date = ?", current_date)[0]
#			result = result + stat.kilometers_walking
#			current_date = current_date.next
#		end
#		result = result - self.kilos_had_walked_on_join_date
#		return result
#	end



	#Determine whether this challenge is completed(by meeting the goal) or expired
	def finished?
	end
end
