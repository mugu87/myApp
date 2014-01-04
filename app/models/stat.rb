# == Schema Information
#
# Table name: stats
#
#  id                    :integer          not null, primary key
#  today_active_calories :integer
#  created_at            :datetime
#  updated_at            :datetime
#  user_id               :integer
#

class Stat < ActiveRecord::Base

    belongs_to :user

    # update the stats with fitbit data. Fitbit data is a hash with the 
    # following entries:
    # 1.
    def update_fitbit_stat (user_id, data)
	#NOTE make sure that the filed data_source=="fitbit"
    end

    # update the stats with mobile app data. Mobile app is a hash with the
    # following entries:
    # 1.
    def update_mobile_stat (user_id, data)
    end

    # calculate the calories burned NOTE lookup the formula, is there a difference between walking and running?
    def get_calories_burned(user_height, user_weight, user_sex)
    end






end
