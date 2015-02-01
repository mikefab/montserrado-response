class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.boolean :is_supervisor
      t.text   :notes


      t.timestamps null: false
    end

  end
end
