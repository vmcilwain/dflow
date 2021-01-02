class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def about
    @about = About.any? ? About.last : About.new
    @links = [helpers.link_to(:Home, root_url)]
    
    if current_user&.has_role?(:administrator)
      @links << if About.any?
        helpers.link_to(:Edit, edit_about_path(About.last))
      else
        helpers.link_to(:Create, new_about_path)
      end
    end

  end
  
end