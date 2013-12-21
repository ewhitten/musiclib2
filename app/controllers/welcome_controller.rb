class WelcomeController < ApplicationController
  respond_to :html, :js
  before_filter :load_stats

  def index
    @q = Track.search(params[:q])
    @tracks = params[:q].present? && @q.result(distinct: true) || []
  end
  
  def search
    index
    render :index
  end

end
