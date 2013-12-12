class ArtistVolume < ActiveRecord::Base
  belongs_to :artist
  belongs_to :volume
end
