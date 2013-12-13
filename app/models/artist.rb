class Artist < ActiveRecord::Base
  has_and_belongs_to_many :volumes
  has_many :tracks
  has_many :categories, through: :tracks
  
  validates_uniqueness_of :name
  
  default_scope { order(:name) }
end
