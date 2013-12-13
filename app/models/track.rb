class Track < ActiveRecord::Base
  belongs_to :artist, touch: true
  belongs_to :volume, touch: true
  belongs_to :category, touch: true
  
  validates_presence_of :index
  validates_presence_of :name
  
  default_scope { order(:artist_id, :volume_id, :index)}
  
  def location
    volume && "#{volume.location}-#{index}" || "Unknown"
  end
  
end
