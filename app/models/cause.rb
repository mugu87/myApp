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

class Cause < ActiveRecord::Base
	belongs_to :event
	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

	#validates_attachment :photo,
		  #:content_type => { :content_type => ["image/jpg", "image/gif", "image/png"] }
end
