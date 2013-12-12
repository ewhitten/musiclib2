class Track < ActiveRecord::Base
  belongs_to :artist
  belongs_to :volume
  belongs_to :category
  
  validates_presence_of :num
  validates_presence_of :name
  
  def location
    volume && "#{volume.location}-#{num}" || "Unknown"
  end
  
end
