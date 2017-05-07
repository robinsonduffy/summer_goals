class RemovePointsFromKids < ActiveRecord::Migration
  def self.up
    remove_column :kids, :points
  end

  def self.down
    add_column :kids, :points, :integer, :default => 0
  end
end
