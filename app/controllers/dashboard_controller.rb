# Assuming you have this file: app/controllers/dashboard_controller.rb

class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    # any logic for the dashboard
  end
end
