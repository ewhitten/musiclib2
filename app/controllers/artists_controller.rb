class ArtistsController < ApplicationController
  respond_to :html, :js, :json
  
  before_filter :load_artists, only: [:index]
  before_filter :find_artist, only: [:show, :edit, :update, :destroy]
  before_filter :load_artist_tracks, only: [:show]
  before_filter :build_artist, only: [:new, :create]

  def index
    respond_with @artists do |format|
      format.json { render json: @artists.tokens(params[:q])}
    end
  end

  def create
    @artist.save
    respond_with @artist
  end
  
  def update
    @artist.update_attributes params[:artist]
    respond_with @artist
  end
  
  def destroy
    @artist.destroy
    respond_with @artist
  end
  
  
  protected
  
  def load_artists
    @artists = Artist.all
  end
  
  def find_artist
    @artist = Artist.find(params[:id])
  end
  
  def load_artist_tracks
    @volumes = @artist.volumes
    @track_volumes = (@artist.tracks - @volumes.map {|v| v.tracks}.flatten).map {|t| t.volume}.uniq.sort {|a,b| a.name <=> b.name}
  end
  
  def build_artist
    @artist = @artist.build params[:artist]
  end
  
end
