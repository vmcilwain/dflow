# TODO move admin actions to admin namespace
class AboutsController < ApplicationController
  before_action :about, only: %i[edit update]
  
  def new
    authorize About
    
    @about = About.new
  end

  def create
    authorize About

    @about = About.new(about_params)
     
    respond_to do |format|
      if @about.save
        format.html { redirect_to about_page_path, success: success_message(@about) }
        format.js
      else
        flash[:error] = error_message
        format.html { render :new }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @about.update(about_params)
        format.html { redirect_to about_page_path, success: success_message(@about, :updated) }
        format.js
      else
        flash[:error] = error_message
        format.html { render :edit }
        format.js
      end
    end
  end
  
  private

  def about
    @about = About.find params[:id]
    authorize @about
  end
  
  def about_params
    params.require(:about).permit(:title, :body)
  end
  
end