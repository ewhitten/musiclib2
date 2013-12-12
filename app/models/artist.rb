class Artist < ActiveRecord::Base
  has_and_belongs_to_many :volumes
  validates_uniqueness_of :name
end
