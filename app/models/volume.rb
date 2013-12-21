class Volume < ActiveRecord::Base
  belongs_to :category
  belongs_to :artist, touch: true
  has_many :tracks
  default_scope { order(:artist_id, :created_at)}
  
  attr_reader :artist_token
  
  def name_and_location
    "#{name} (#{location})"
  end
  
  def artist_token=(token)
    aname = token.gsub(/<<</, "").gsub(/>>>/, "")
    self.artist_id = Artist.create!(name: aname).id
  end
  
end
