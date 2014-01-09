class AddMoreAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :height, :integer
    add_column :users, :weight, :integer
    add_column :users, :user_type, :string
    add_column :users, :name, :string
    add_column :users, :gender, :string
    add_column :users, :dob, :date
    add_column :users, :company_id, :integer
	add_column :users, :device_type, :string
  end
end
