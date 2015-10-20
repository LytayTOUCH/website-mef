class AdministratorController < ApplicationController
  before_action :authenticate_administrator!

  layout 'admin_application'

  def index
    @user = current_administrator
  end

  def home
  end
end
