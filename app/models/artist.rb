class Artist < ActiveRecord::Base
  has_many :volumes
  has_many :tracks
  has_many :categories, through: :tracks
  
  validates_uniqueness_of :name
  default_scope { order(:name) }
  
  def self.tokens(query)
    results = where("lower(name) like ?", "%#{query.downcase}%")
    results.blank? && [{id: "<<<#{query}>>>", name: "New: \"#{query}\""}] || results
  end
  
end
