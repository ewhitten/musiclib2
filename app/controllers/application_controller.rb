class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #before_filter :load_stats
  
  def load_stats
    @artist_count = Artist.count
    @album_count = Volume.count
    @track_count = Track.count
  end
end
