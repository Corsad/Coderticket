class AddPublishedAndCreaterIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :published, :boolean, :default => false
    add_column :events, :creater_id, :integer
  end
end
