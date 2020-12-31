class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def about
    @about = About.any? ? About.last : About.new
  end
  
end