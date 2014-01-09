# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  height                 :integer
#  weight                 :integer
#  user_type              :string(255)
#  name                   :string(255)
#  gender                 :string(255)
#  dob                    :date
#  company_id             :integer
#  device_type            :string(255)
#  provider               :string(255)
#  uid                    :string(255)
#  oauth_token            :string(255)
#  oauth_secret           :string(255)
#

class User < ActiveRecord::Base
	include StatsHelper
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable, 
		:omniauthable, :omniauth_providers => [:fitbit]
	has_many :stats
	has_many :donations
	belongs_to :cause

	def get_calories_gained_on_date (date)
	end

	def get_calories_lost_on_date (date)
	end

	def get_calories_balance_on_date(date)
	end

	#methods to get data from fitbit and update it
	#@require: self.device_type = "fitbit"
	def update_fitbit_stats(client)
		myStats = self.stats

        lastest_update_stat = myStats.order("stat_date DESC").first
		if(lastest_update_stat == nil)
			lastest_update_stat = self.stats.build
			lastest_update_stat[:stat_date] = Date.today
		end
		
		update_fb_data_by_date(client,lastest_update_stat)
	end

	#def update_fb_data_by_date(client,last_date)
	def update_fb_data_by_date(client,lastest_stat)
		while(lastest_stat[:stat_date] <= Date.today)
			fb_data = client.activities_on_date(lastest_stat[:stat_date]) 
			miles_running = fb_data["summary"]["distances"][3]["distance"]  #This is the veryActive activity
			miles_walking = fb_data["summary"]["distances"][4]["distance"]  #This is the moderatelyActive activity
			fairlyActiveMinutes = fb_data["summary"]["fairlyActiveMinutes"]
			veryActiveMinutes = fb_data["summary"]["veryActiveMinutes"]

			stat_to_build = lastest_stat

			stat_to_build.step_count_walking = StatsHelper.get_steps_count_walking (miles_walking) 
			stat_to_build.step_count_running = StatsHelper.get_steps_count_running (miles_running)
			stat_to_build.kilometers_running = StatsHelper.miles_to_kilo(miles_running)
			stat_to_build.kilometers_walking = StatsHelper.miles_to_kilo(miles_walking)
			stat_to_build.calories_burned_walking = StatsHelper.get_cal_burned_walking (miles_walking)
			stat_to_build.calories_burned_running = StatsHelper.get_cal_burned_running (miles_running)
			stat_to_build.seconds_walking = StatsHelper.min_to_sec(fairlyActiveMinutes)
			stat_to_build.seconds_running = StatsHelper.min_to_sec(veryActiveMinutes)

			stat_to_build.save

			#last_date = last_date.next 
			lastest_stat = self.stats.build
			lastest_stat[:stat_date] = stat_to_build[:stat_date] + 1
		end
	end



	#methods to get data from mobile device and update it
	#@require: self.device_type = "mobile"
	def update_mobile_stats
	end
	#
	#  def update_stats    #TODO test this with new data being updated at the band
	#    client = self.fitbit_data
	#    myStats = self.stats
	#    lastestRecord = myStats.order("created_at").last #NOTE Should this be "created_at" or "update_at"
	#
	#  end

	def self.find_for_fitbit_oauth(auth, signed_in_resource=nil)
		user = User.where(:provider => auth.provider, :uid => auth.uid).first
		unless user
			user = User.create(name:auth.extra.raw_info.name,
							   provider:auth.provider,
							   uid:auth.uid,
							   name: auth['info']['full_name'],
							   oauth_token: auth['credentials']['token'],
							   oauth_secret: auth['credentials']['secret'],
							   password:Devise.friendly_token[0,20]
							  )
		end
		user
	end

	def self.new_with_session(params, session)
		if session["devise.user_attributes"]
			new(session["devise.user_attributes"]) do |user|
				user.attributes = params
			end
		else
			super
		end
	end

	def fitbit_data
		raise "Account is not linked with a Fitbit account" unless linked?
		@client ||= Fitgem::Client.new(
			:consumer_key => ENV["FITBIT_CONSUMER_KEY"],
			:consumer_secret => ENV["FITBIT_CONSUMER_SECRET"],
			:token => oauth_token,
			:secret => oauth_secret,
			:user_id => uid
		)
	end

	def has_fitbit_data?
		!@client.nil?
	end

	def linked?
		oauth_token.present? && oauth_secret.present?
	end

end
