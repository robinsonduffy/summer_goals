class AddRequiredToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :required, :boolean, :null => false, :default => false
  end

  def self.down
    remove_column :tasks, :required
  end
end
