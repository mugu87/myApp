class DropTableUserstats < ActiveRecord::Migration
  def change
    drop_table :userstats
  end
end
