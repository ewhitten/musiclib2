class ArtistsController < ApplicationController
  respond_to :html, :js
  
  before_filter :load_artists, only: [:index]
  before_filter :find_artist, only: [:show, :edit, :update, :destroy]
  before_filter :build_artist, only: [:new, :create]

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
  
  def build_artist
    @artist = @artist.build params[:artist]
  end
  
end
