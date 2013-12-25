class TracksController < ApplicationController
  respond_to :html, :js
  
  before_filter :load_volume, only: [:new, :edit, :destroy, :update]
  before_filter :load_tracks, only: [:index]
  before_filter :find_track, only: [:show, :edit, :update, :destroy]
  before_filter :build_track, only: [:new, :create]

  def create
    @track.save
    respond_with @track
  end
  
  def update
    @track.update_attributes track_params
    respond_with @track
  end
  
  def destroy
    @track.destroy
    respond_with @track
  end
  
  
  protected
  
  def load_volume
    @volume = Volume.find(params[:volume_id])
  end
  
  def load_tracks
    @tracks = Track.unscoped.order(:name, :artist_id, :volume_id).paginate(page: params[:page])
  end
  
  def find_track
    @track = Track.find(params[:id])
  end
  
  def build_track
    @track = @volume.tracks.new
  end
  
  private
  
  def track_params
    params.require(:track).permit(:name, :artist_id, :index, :artist_id, :artist_token)
  end
  
end
