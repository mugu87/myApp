class JoinedSoloChallenge < ActiveRecord::Base


	#TODO validate that joined challenge is not expired

	#Determine whether this challenge is finished (by expired or having met the goals) or not
	def finished?
		challenge = Challenge.find(self.challenge_id)

		#raise challenge.methods.sort.to_s


		if(challenge.expiration < DateTime.now) then return true
		elsif ((self.kilos_walked > challenge.kilos_to_walk) ||
			   (self.kilos_ran > challenge.kilos_to_run) || 
			   (self.calories_burned > challenge.calories_to_burn)) then return true
		else return false
		end
	end

	def update_challenge_stat
		if self.active then
			lastest = {:kilos_ran_since_joined => 0.0, :kilos_walked_since_joined => 0.0, :calories_burned_since_joined => 0}
			current_date = self.created_at.to_date
			while(current_date <= Date.today)
				stat = Stat.where("stat_date = ? AND user_id = ?", current_date, self.user_id)[0]
				lastest[:kilos_ran_since_joined] = lastest[:kilos_ran_since_joined] + stat.kilometers_running
				lastest[:kilos_walked_since_joined] = lastest[:kilos_walked_since_joined] + stat.kilometers_walking
				current_date = current_date.next
			end
			self.kilos_ran  =  lastest[:kilos_ran_since_joined] - self.kilos_had_ran_on_join_date
			self.kilos_walked =  lastest[:kilos_walked_since_joined] - self.kilos_had_walked_on_join_date
			self.calories_burned = lastest[:calories_burned_since_joined] #TODO fix this so that it get the result from a calculator

			#determine if challenged is finished
			if finished? then self.finished = true end
		end
	end


end
