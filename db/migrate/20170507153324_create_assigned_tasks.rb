class CreateAssignedTasks < ActiveRecord::Migration
  def self.up
    create_table :assigned_tasks do |t|
      t.integer :kid_id
      t.integer :task_id
      t.integer :goal
      t.timestamps
    end
    add_index :assigned_tasks, [:kid_id, :task_id], :unique => true
  end

  def self.down
    drop_table :assigned_tasks
  end
end
