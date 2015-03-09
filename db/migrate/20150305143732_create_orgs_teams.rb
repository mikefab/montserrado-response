class CreateOrgsTeams < ActiveRecord::Migration
  def change
    create_table :orgs_teams do |t|
      t.integer :org_id
      t.integer :team_id

      t.timestamps null: false
    end
  end
end
