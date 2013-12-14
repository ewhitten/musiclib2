class LotsIndexes < ActiveRecord::Migration
  def change
    add_index :artists, :name
    add_index :categories, :name
    
    add_index :tracks, :artist_id
    add_index :tracks, :volume_id
    add_index :tracks, :category_id
    add_index :tracks, :index
    
    add_index :volumes, :artist_id
    add_index :volumes, :category_id
    add_index :volumes, :location
  end
end
