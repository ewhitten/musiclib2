class VolumesController < ApplicationController
  respond_to :html, :js
  
  before_filter :load_volumes, only: [:index]
  before_filter :find_volume, only: [:show, :edit, :update, :destroy]

  def new
    @volume = Volume.new
  end

  def create
    @volume = Volume.create volume_params
    respond_with @volume
  end
  
  def update
    @volume.update_attributes params[:volume]
    respond_with @volume
  end
  
  def destroy
    @volume.destroy
    respond_with @volume
  end
  
  
  protected
  
  def load_volumes
    @volumes = Volume.all
  end
  
  def find_volume
    @volume = Volume.find(params[:id])
  end
  
  private
  
  def volume_params
    params.require(:volume).permit(:name, :location, :category_id, :artist_token)
  end
  
end
