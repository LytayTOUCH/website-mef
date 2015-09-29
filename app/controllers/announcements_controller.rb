class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:show, :edit, :delete, :destroy]

  # layout "admin_application" 
  
  # we can use (layout "layout_name", except: [:method, :method])

  def index
    # @announcements = Announcement.all
  end

  def show_public_service
    
  end

  def show_question_answer
    
  end

  def show_contact
    
  end

# Procurement entity

  def show_procurement_entity_city_province
    
  end
  
  def show_procurement_entity_ministry
    
  end

  def show_procurement_public_foundation
    
  end

# Download

  def show_bidder_list_registrative_form
    
  end

  def show_bidding_document
    
  end

  def show_planning_approval_correction
    
  end

# about
  def show_gdpp_role
    
  end
  def show_gdpp_structure
    
  end

# order menu
  def show_procurement_goods
    
  end



end
