class AnnouncementsController < ApplicationController

  def index
    @announcements = Announcement.all
  end

  def edit
    @announcement = Announcement.find(params[:id])
  end

  def show
    @announcement = Announcement.find(params[:id])
  end

  def new
    @announcements = Announcement.new
  end

  def create
    @announcements = Announcement.new(announcement_params)
    if @announcements.save
      redirect_to announcements_path
    else
      render 'new'
    end
  end

  def destroy
    @announcements.destroy
    
    redirect_to announcements_path
  end

  def update
    @announcements = Announcement.find(params[:id])
    if @announcements.update_attributes(announcement_params)
      redirect_to announcements_path
    else
      render 'edit'
    end
  end

  private
  def announcement_params
    params.require(:announcement).permit(:titile, 
      :description, :entity, :bidding_expired_date, 
      :budget_source, :attachment, :bidding_attachment)
  end
end
