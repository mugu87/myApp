# == Schema Information
#
# Table name: causes
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  description        :text
#  user_id            :integer
#  contact            :text
#  link               :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

require 'spec_helper'

describe Cause do
  pending "add some examples to (or delete) #{__FILE__}"
end
