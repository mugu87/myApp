class AddPhotoColumnToCauses < ActiveRecord::Migration
  def change
	  add_attachment :causes, :photo
  end
end
