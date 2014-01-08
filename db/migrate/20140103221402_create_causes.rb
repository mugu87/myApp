class CreateCauses < ActiveRecord::Migration
  def change
    create_table :causes do |t|
      t.string :name
      t.text :description
      t.integer :user_id
	  t.text :contact
	  t.string :link
      t.timestamps
    end
  end
end
