class CreateOrgs < ActiveRecord::Migration
  def change
    create_table :orgs do |t|
      t.string :name
      t.string :nick
      t.text :description

      t.timestamps null: false
    end

    Org.db_seed
  end
end
