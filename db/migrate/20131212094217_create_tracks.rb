class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.integer :category_id
      t.integer :artist_id
      t.integer :volume_id
      t.integer :index

      t.timestamps
    end
  end
end
