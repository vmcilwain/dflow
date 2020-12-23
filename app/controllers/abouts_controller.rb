class AboutsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :about, only: %i[edit update]
  
  def index
    @about = About.last
  end
  
  def new
    @about = About.new
  end

  def create
    @about = About.new(about_params)
     
    respond_to do |format|
      if @about.save
        format.html { redirect_to abouts_path, success: success_message(@about) }
        format.js
      else
        flash[:error] = error_message
        format.html { render :new }
        format.js
      end
    end
  end
  

  private

  def about
    @about = About.find params[:id]
  end
  
  def about_params
    params.require(:about).permit(:title, :body)
  end
  
end