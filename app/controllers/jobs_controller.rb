# app/controllers/jobs_controller.rb

require 'httparty'
require 'cgi'

class JobsController < ApplicationController

  def index
    @jobs = Job.last(10) 
  end

  def show
    @job = Job.find(params[:id])
    
    # Fetch full description from API and update the record before displaying
    @job.update(description: get_full_description(@job)) 
  end

  def search
    serp_api_credentials = Rails.application.credentials.serp_api
    
    if params[:q].present?
    
      begin
      
        response = HTTParty.get("#{serp_api_credentials[:endpoint]}&api_key=#{serp_api_credentials[:api_key]}&q=#{CGI.escape(params[:q])}")
        @results = JSON.parse(response.body)
        
        @results["jobs_results"].each do |job_data|
          job = Job.new(
            title: job_data["title"],
            company_name: job_data["company_name"],
            description: job_data["description"], # Added this line to include description
            # etc
          )
          job.save 
        end
        
        @jobs = Job.last(10)
        
      rescue => e
        @jobs = []
        flash[:alert] = "Error: #{e.message}"
      end
      
    else
      @jobs = [] 
    end
  end
  
  private

  def get_full_description(job)
    # API call to get full description and return it
    # Implement the details of this method based on your API's documentation
  end

end
