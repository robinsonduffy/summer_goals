class CreateCompletedTasks < ActiveRecord::Migration
  def self.up
    create_table :completed_tasks do |t|
      t.integer :kid_id
      t.integer :task_id
      t.date :date
      t.timestamps
    end
  end

  def self.down
    drop_table :completed_tasks
  end
end
