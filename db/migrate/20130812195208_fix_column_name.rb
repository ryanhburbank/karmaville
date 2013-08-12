class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :total_karma_points, :total_karma
  end
end
