class TracksController < ApplicationController
  respond_to :html, :js
  
  before_filter :load_tracks, only: [:index]
  before_filter :find_track, only: [:show, :edit, :update, :destroy]
  before_filter :build_track, only: [:new, :create]

  def create
    @track.save
    respond_with @track
  end
  
  def update
    @track.update_attributes params[:track]
    respond_with @track
  end
  
  def destroy
    @track.destroy
    respond_with @track
  end
  
  
  protected
  
  def load_tracks
    @tracks = Track.unscoped.order(:name, :artist_id, :volume_id).paginate(page: params[:page])
  end
  
  def find_track
    @track = Track.find(params[:id])
  end
  
  def build_track
    @track = @track.build params[:track]
  end
  
end
