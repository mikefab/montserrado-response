class CreateOrgsPeople < ActiveRecord::Migration
  def change
    create_table :orgs_people do |t|
      t.integer :org_id
      t.integer :person_id

      t.timestamps null: false
    end
  end
end
