class CreateArtistVolumes < ActiveRecord::Migration
  def change
    create_table :artists_volumes do |t|
      t.integer :artist_id
      t.integer :volume_id

      t.timestamps
    end
  end
end
