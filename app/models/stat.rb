# == Schema Information
#
# Table name: stats
#
#  id                      :integer          not null, primary key
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
#  challenge_id            :integer
#  created_at              :datetime
#  updated_at              :datetime
#

class Stat < ActiveRecord::Base

	belongs_to :user
end
