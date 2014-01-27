module JoinedChallengesHelper

	def self.kilos_ran_since_joined
		result = 0.0
		current_date = self.created_at.to_date
		while(current_date <= Date.today)
			stat = Stat.where("stat_date = ?", current_date)
			result = result + stat.kilometers_running
			current_date = current_date.next
		end
		result = result - self.kilos_had_ran_on_join_date
		return result
	end

	def self.kilos_walked_since_joined
	end

end
