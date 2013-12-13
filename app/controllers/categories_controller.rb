class CategoriesController < ApplicationController
  respond_to :html, :js
  
  before_filter :load_categories, only: [:index]
  before_filter :find_category, only: [:show, :edit, :update, :destroy]
  before_filter :build_category, only: [:new, :create]

  def create
    @category.save
    respond_with @category
  end
  
  def update
    @category.update_attributes params[:category]
    respond_with @category
  end
  
  def destroy
    @category.destroy
    respond_with @category
  end
  
  
  protected
  
  def load_categories
    @categories = Category.all
  end
  
  def find_category
    @category = Category.find(params[:id])
  end
  
  def build_category
    @category = @category.build params[:category]
  end

end
