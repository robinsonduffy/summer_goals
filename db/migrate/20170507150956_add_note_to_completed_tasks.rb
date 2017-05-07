class AddNoteToCompletedTasks < ActiveRecord::Migration
  def self.up
    add_column :completed_tasks, :note, :string
  end

  def self.down
    remove_column :completed_tasks, :note
  end
end
