class VolumesController < ApplicationController
  respond_to :html, :js
  
  before_filter :load_volumes, only: [:index]
  before_filter :find_volume, only: [:show, :edit, :update, :destroy]
  before_filter :build_volume, only: [:new, :create]

  def create
    @volume.save
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
  
  def build_volume
    @volume = @volume.build params[:volume]
  end
end
