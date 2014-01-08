# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  cause_id    :integer
#  description :text
#  fund        :float
#  date        :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

class Event < ActiveRecord::Base
	has_many :causes
end
