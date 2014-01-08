# == Schema Information
#
# Table name: stats
#
#  id                      :integer          not null, primary key
#  today_active_calories   :integer
#  user_id                 :integer
#  step_count_walking      :integer
#  step_count_running      :integer
#  seconds_walking         :integer
#  seconds_running         :integer
#  kilometers_walking      :float
#  kilometers_running      :float
#  calories_burned_walking :integer
#  calories_burned_running :integer
#  data_source             :string(255)
#  stat_date               :date
#  created_at              :datetime
#  updated_at              :datetime
#

class Stat < ActiveRecord::Base

	belongs_to :user

	# update the stats with fitbit data. Fitbit data is a hash with the 
	# following entries:
	# 1.
	# @require: date.is_a?Date
	# 			user_id.is_a?Integer
	# 			data == @client.activities_on_date(date)
	def update_fitbit_stat (user_id, date, data)
		if(Stat.where(:user_id => user_id,:stat_date => date ).length == 1)
			@user_to_update = Stat.where(:user_id => user_id,:stat_date => date )
		else
			@user_to_update = Stat.new
			@user_to_update.data_source = "fitbit"
			@user_to_update.stat_date = date
			@user_to_update.user_id = user_id
		end

		miles_running = data["summary"]["distances"][3]["distance"]  #This is the veryActive activity
		miles_walking = data["summary"]["distances"][4]["distance"]  #This is the moderatelyActive activity

		@user_to_update.step_count_walking = get_steps_count_walking (miles_walking)
		@user_to_update.step_count_running = get_steps_count_running (miles_running)
		@user_to_update.kilometers_walking = get_kilo_walking (miles_walking)
		@user_to_update.kilometers_running = get_kilo_running (miles_running)
		@user_to_update.calories_burned_walking = get_cal_burned_walking (miles_walking)
		@user_to_update.calories_burned_running = get_cal_burned_running (miles_running)
		@user_to_update.seconds_walking = get_sec_walking(miles_walking)
		@user_to_update.seconds_running = get_sec_running (miles_running)

		@user_to_update.save




	end

	# update the stats with mobile app data. Mobile app is a hash with the
	# following entries:
	# 1.
	def update_mobile_stat (user_id, data)
		#TODO make sure that the field data_source=="mobile"
	end

	# calculate the calories burned NOTE lookup the formula, is there a difference between walking and running?
	def get_calories_burned(user_height, user_weight, user_sex)
	end






end
