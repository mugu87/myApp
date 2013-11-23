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
end
