class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :name
      t.integer :zone_id
      t.text :description
      t.text :notes

      t.timestamps null: false
    end

    reversible do |dir|
      dir.up do
        Community.seed_data if ActiveRecord::Base.connection.table_exists? 'communities'
      end
    end
  end
end
