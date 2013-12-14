class WelcomeController < ApplicationController
  before_filter :load_stats, only: [:index]


  protected
  
  def load_stats
    @artist_count = Artist.count
    @album_count = Volume.count
    @track_count = Track.count
  end
  
end
