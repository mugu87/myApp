class CreateNpos < ActiveRecord::Migration
  def change
    create_table :npos do |t|
      t.string :name
      t.float :rate
      t.string :address
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
