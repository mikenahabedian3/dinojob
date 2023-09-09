# app/controllers/jobs_controller.rb

require 'httparty'
require 'cgi'

class JobsController < ApplicationController
  
  def index
    # Removing the loading of all jobs in the index action
  end

  def show
    @job = Job.find(params[:id])
  end

  def search
    serp_api_credentials = Rails.application.credentials.serp_api

    if params[:q].present?
      begin
        response = HTTParty.get("#{serp_api_credentials[:endpoint]}&api_key=#{serp_api_credentials[:api_key]}&q=#{CGI.escape(params[:q])}")
        @results = JSON.parse(response.body)
      rescue => e
        @results = []
        flash[:alert] = "An error occurred: #{e.message}"
      end
    else
      @results = []
    end
  end
end
