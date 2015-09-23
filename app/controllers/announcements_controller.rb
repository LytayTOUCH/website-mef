class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:show, :edit, :delete, :destroy]

  # layout "admin_application" 
  
  # we can use (layout "layout_name", except: [:method, :method])


  def index
    # @announcements = Announcement.all
  end

end
