class CreateTasksTeams < ActiveRecord::Migration
  def change
    create_table :tasks_teams do |t|
      t.integer :task_id
      t.integer :team_id

      t.timestamps null: false
    end
  end
end
