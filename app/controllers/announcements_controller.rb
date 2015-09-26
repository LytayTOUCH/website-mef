class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:show, :edit, :delete, :destroy]

  # layout "admin_application" 
  
  # we can use (layout "layout_name", except: [:method, :method])

  def index
    # @announcements = Announcement.all
  end

  def public_service
    
  end

  def question_answer
    
  end

  def contact
    
  end

end
