class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:show, :edit, :delete, :destroy]

  def index
    @announcements = Announcement.all
  end

  def edit
    
  end

  def show
    
  end

  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announcement_params)
    if @announcement.save
      redirect_to announcements_path
    else
      render 'new'
    end
  end

  def destroy
    @announcement.destroy
    redirect_to announcements_path
  end

  def update
    @announcement = Announcement.find(params[:id])
    if @announcement.update_attributes(announcement_params)
      redirect_to announcements_path
    else
      render 'edit'
    end
  end

  def delete_attachment
    @announcement = Announcement.find_by_id(params[:id])
    @announcement.attachment = nil
    if @announcement.save
      redirect_to announcements_path
    else
      render 'new'
    end
  end

  def delete_bidding_attachment
    @announcement = Announcement.find_by_id(params[:id])
    @announcement.bidding_attachment = nil
    if @announcement.save
      redirect_to announcements_path
    else
      render 'new'
    end
  end
  
  private
  def set_announcement
    @announcement = Announcement.find(params[:id])
  end

  def announcement_params
    params.require(:announcement).permit(:title, 
      :description, :entity, :bidding_expired_date, 
      :budget_source, :attachment, :bidding_attachment)
  end
end
