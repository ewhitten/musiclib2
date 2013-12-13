class Volume < ActiveRecord::Base
  belongs_to :category
  belongs_to :artist, touch: true
  has_many :tracks
  
  default_scope { order(:artist_id, :created_at)}
end
