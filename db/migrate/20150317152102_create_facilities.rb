class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.integer :zone_id
      t.string :contact_numbers
      t.string :name
      t.string :location
      t.string :contact_name
      t.integer :beds
      t.float :lat
      t.float :lon
      t.string :level

      t.timestamps null: false
    end
    reversible do |dir|
      dir.up do
        Facility.seed_data if ActiveRecord::Base.connection.table_exists? 'facilities'
      end
    end
  end
end
