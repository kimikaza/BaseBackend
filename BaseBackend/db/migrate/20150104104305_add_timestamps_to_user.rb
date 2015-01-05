class AddTimestampsToUser < ActiveRecord::Migration
  def change
    add_column :users, :created_at, :timestamp
    add_column :users, :updated_at, :timestamp
  end
end
