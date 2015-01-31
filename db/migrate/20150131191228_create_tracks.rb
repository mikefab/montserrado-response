class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :ip
      t.string :params

      t.timestamps null: false
    end
  end
end
