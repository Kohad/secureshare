class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  # GET /dashboard/index
  def index
  end
end
