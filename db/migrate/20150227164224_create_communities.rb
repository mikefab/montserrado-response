class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :name
      t.integer :zone_id
      t.text :description
      t.text :notes

      t.timestamps null: false
    end
    Community.seed_data
  end
end
