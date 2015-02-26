class CreatePeoplePositions < ActiveRecord::Migration
  def change
    create_table :people_positions do |t|
      t.integer :person_id
      t.integer :position_id

      t.timestamps null: false
    end
  end
end
