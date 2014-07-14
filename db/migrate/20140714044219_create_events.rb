class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :venue
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :price
      t.string :organizer
      t.string :phone

      t.timestamps
    end
  end
end
