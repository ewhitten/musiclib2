class CreateVolumes < ActiveRecord::Migration
  def change
    create_table :volumes do |t|
      t.string :name
      t.string :location
      t.integer :category_id
      t.integer :year
      t.integer :artist_id

      t.timestamps
    end
  end
end
