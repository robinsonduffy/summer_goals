class CreateKidsTasks < ActiveRecord::Migration
  def self.up
    create_table :kids_tasks, :id => false do |t|
      t.integer :kid_id
      t.integer :task_id
      t.timestamps
    end
  end

  def self.down
    drop_table :kids_tasks
  end
end
