class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.text :description
      t.string :name
      t.integer :objectID
      t.string :epi_code
      t.float :shape_leng
      t.float :shape_area
      t.string :cnam
      t.string :geometry

      t.timestamps null: false
    end
    
    Zone.seed_data

  end
end
