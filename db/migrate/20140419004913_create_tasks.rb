class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :name, :null => false
      t.integer :points, :default => 1, :null => false
      t.string :image
      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
