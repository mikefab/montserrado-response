class CreatePeopleTeams < ActiveRecord::Migration
  def change
    create_table :people_teams do |t|
      t.integer :person_id
      t.integer :team_id

      t.timestamps null: false
    end
  end
end
