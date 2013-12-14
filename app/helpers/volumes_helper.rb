module VolumesHelper
  
  def cache_key_for(klass)
      count          = klass.count
      max_updated_at = klass.maximum(:updated_at).try(:utc).try(:to_s, :number)
      "#{klass.to_s.pluralize}/all-#{count}-#{max_updated_at}"
    end
end
