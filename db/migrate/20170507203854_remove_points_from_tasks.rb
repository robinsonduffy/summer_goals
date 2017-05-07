class RemovePointsFromTasks < ActiveRecord::Migration
  def self.up
    remove_column :tasks, :points
  end

  def self.down
    add_column :tasks, :points, :integer, :default => 0
  end
end
