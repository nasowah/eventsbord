class CreateRegistrants < ActiveRecord::Migration
  def change
    create_table :registrants do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile
      t.string :email
      t.integer :ticket

      t.timestamps
    end
  end
end
