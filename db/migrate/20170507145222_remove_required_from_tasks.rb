class RemoveRequiredFromTasks < ActiveRecord::Migration
  def self.up
    remove_column :tasks, :required
  end

  def self.down
    add_column :tasks, :required, :boolean, :null => false, :default => false
  end
end
