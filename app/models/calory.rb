# == Schema Information
#
# Table name: calories
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  trans      :integer
#

class Calory < ActiveRecord::Base
  belongs_to :user


end
