# == Schema Information
#
# Table name: npos
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  rate       :float
#  address    :string(255)
#  phone      :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Npo < ActiveRecord::Base
  has_many :donations
end
