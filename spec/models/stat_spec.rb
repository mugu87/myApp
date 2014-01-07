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

require 'spec_helper'

describe Stat do
  pending "add some examples to (or delete) #{__FILE__}"
end
