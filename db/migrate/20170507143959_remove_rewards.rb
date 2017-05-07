class RemoveRewards < ActiveRecord::Migration
  def self.up
    drop_table :rewards
  end
end
