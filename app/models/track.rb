class Track < ActiveRecord::Base
  belongs_to :artist, touch: true
  belongs_to :volume, touch: true
  belongs_to :category, touch: true
  
  validates_presence_of :index
  validates_presence_of :name
  
  attr_accessor :artist_token
  default_scope { order(:index)}
  
  self.per_page = 100
    
  def location
    volume && "#{volume.location}-#{index}" || "Unknown"
  end
  
end
