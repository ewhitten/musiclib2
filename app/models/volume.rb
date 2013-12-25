class Volume < ActiveRecord::Base
  belongs_to :category
  belongs_to :artist, touch: true
  has_many :tracks
  accepts_nested_attributes_for :tracks, reject_if: proc { |t| t['name'].blank? }

  default_scope { order(:artist_id, :created_at)}
  
  attr_reader :artist_token
  
  def name_and_location
    "#{name} (#{location})"
  end
  
  def artist_token=(token)
    aname = token.gsub(/<<</, "").gsub(/>>>/, "")
    self.artist_id = (token.to_i > 0) && token.to_i || Artist.find_or_create_by!(name: aname).id
  end
  
end
