module ApplicationHelper
  
  def title(txt)
    content_for(:title) { txt }
  end
  
  def cache_key_for(klass)
    count          = klass.count
    max_updated_at = klass.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "#{klass.to_s.pluralize}/all-#{count}-#{max_updated_at}"
  end

  def stats_cache_key
    "artist_#{Artist.count}/track_#{Track.count}/volume_#{Volume.count}"
  end
  
  def controller_class
    params[:controller]
  end

  
end
