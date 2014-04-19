class CreateKids < ActiveRecord::Migration
  def self.up
    create_table :kids do |t|
      t.string :name, :null => false
      t.integer :points, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :kids
  end
end
