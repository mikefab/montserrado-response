class CreateTeamsZones < ActiveRecord::Migration
  def change
    create_table :teams_zones do |t|
      t.integer :team_id
      t.integer :zone_id

      t.timestamps null: false
    end
  end
end
