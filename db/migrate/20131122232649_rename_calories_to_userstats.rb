class RenameCaloriesToUserstats < ActiveRecord::Migration
  def change
    rename_table :calories, :userstats
  end
end
