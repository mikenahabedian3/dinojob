class LocationsController < ApplicationController
  def autocomplete
    locations = [
      "Montgomery, AL", "Juneau, AK", "Phoenix, AZ", "Little Rock, AR", "Sacramento, CA",
      "Denver, CO", "Hartford, CT", "Dover, DE", "Tallahassee, FL", "Atlanta, GA",
      "Honolulu, HI", "Boise, ID", "Springfield, IL", "Indianapolis, IN", "Des Moines, IA",
      "Topeka, KS", "Frankfort, KY", "Baton Rouge, LA", "Augusta, ME", "Annapolis, MD",
      "Boston, MA", "Lansing, MI", "St. Paul, MN", "Jackson, MS", "Jefferson City, MO",
      "Helena, MT", "Lincoln, NE", "Carson City, NV", "Concord, NH", "Trenton, NJ",
      "Santa Fe, NM", "Albany, NY", "Raleigh, NC", "Bismarck, ND", "Columbus, OH",
      "Oklahoma City, OK", "Salem, OR", "Harrisburg, PA", "Providence, RI", "Columbia, SC",
      "Pierre, SD", "Nashville, TN", "Austin, TX", "Salt Lake City, UT", "Montpelier, VT",
      "Richmond, VA", "Olympia, WA", "Charleston, WV", "Madison, WI", "Cheyenne, WY"
    ]

    if params[:term].present?
      term = params[:term].downcase
      locations = locations.select { |location| location.downcase.include?(term) }
    end

    render json: locations
  end
end
