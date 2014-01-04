class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :cause_id
      t.text :description
      t.float :fund
      t.datetime :date

      t.timestamps
    end
  end
end
