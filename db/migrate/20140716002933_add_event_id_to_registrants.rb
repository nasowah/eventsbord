class AddEventIdToRegistrants < ActiveRecord::Migration
  def change
    add_column :registrants, :event_id, :integer
  end
end
