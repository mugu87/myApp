# == Schema Information
#
# Table name: challenges
#
#  id                  :integer          not null, primary key
#  cost_per_completion :float
#  expiration          :datetime
#  cause_id            :integer
#  challenge_type      :string(255)
#  kilo_to_walk        :float
#  kilo_to_run         :float
#  calories_to_burn    :integer
#  user_id             :integer
#  created_at          :datetime
#  updated_at          :datetime
#

require 'spec_helper'

describe Challenge do
  pending "add some examples to (or delete) #{__FILE__}"
end
