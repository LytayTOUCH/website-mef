class AdminAnnouncementsController < ApplicationController
	 before_action :set_announcement, only: [:show, :edit, :delete, :destroy]

  layout "admin_application" 
  
  # we can use (layout "layout_name", except: [:method, :method])


  def index
    @admin_announcements = Announcement.all
  end

  def edit
    @admin_announcement = Announcement.find(params[:id])
  end

  def show
    
  end

  def new
    @admin_announcement = Announcement.new
  end

  def create
    @admin_announcement = Announcement.new(announcement_params)
    if @admin_announcement.save
      redirect_to admin_announcements_path
    else
      render 'new'
    end
  end

  def destroy
    @admin_announcement.destroy
    redirect_to admin_announcements_path
  end

  def update
    @admin_announcement = Announcement.find(params[:id])
    if @admin_announcement.update_attributes(announcement_params)
      redirect_to admin_announcements_path
    else
      render 'edit'
    end
  end

  def delete_attachment
    @admin_announcement = Announcement.find_by_id(params[:id])
    @admin_announcement.attachment = nil
    if @admin_announcement.save
      redirect_to admin_announcements_path
    else
      render 'new'
    end
  end

  def delete_bidding_attachment
    @admin_announcement = Announcement.find_by_id(params[:id])
    @admin_announcement.bidding_attachment = nil
    if @admin_announcement.save
      redirect_to admin_announcements_path
    else
      render 'new'
    end
  end
  
  private
  def set_announcement
    @admin_announcement = Announcement.find(params[:id])
  end

  def announcement_params
    # binding.pry
    params.require(:announcement).permit(:title, 
      :description, :entity, :bidding_expired_date, 
      :budget_source, :attachment, :bidding_attachment)
  end
end
