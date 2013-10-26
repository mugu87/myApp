# == Schema Information
#
# Table name: donations
#
#  id               :integer          not null, primary key
#  npo_id           :integer
#  user_id          :integer
#  amount_donated   :float
#  calories_donated :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Donation < ActiveRecord::Base
  belongs_to :user
  belongs_to :npo
end
