# == Schema Information
#
# Table name: challenges
#
#  id                  :integer          not null, primary key
#  cost_per_completion :float
#  expiration          :datetime
#  cause_id            :integer
#  created_at          :datetime
#  updated_at          :datetime
#

require 'spec_helper'

describe Challenge do
  pending "add some examples to (or delete) #{__FILE__}"
end
