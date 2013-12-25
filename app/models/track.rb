class Track < ActiveRecord::Base
  belongs_to :artist, touch: true
  belongs_to :volume, touch: true
  belongs_to :category, touch: true
  
  validates_presence_of :index
  validates_presence_of :name
  
  accepts_nested_attributes_for :artist
  validates_uniqueness_of :name, scope: [:volume_id, :artist_id]
  validates_uniqueness_of :index, scope: :volume_id
  
  attr_accessor :artist_token
  default_scope { order(:index)}
  
  self.per_page = 100
    
  def location
    volume && "#{volume.location}-#{index}" || "Unknown"
  end
  
  def artist_id
    self[:artist_id] || volume.artist_id
  end
  
  def artist_token=(token)
    aname = token.gsub(/<<</, "").gsub(/>>>/, "")
    self.artist_id = (token.to_i > 0) && token.to_i || Artist.find_or_create_by!(name: aname).id
    binding.pry
  end
  
end
