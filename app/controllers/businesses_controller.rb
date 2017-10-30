class BusinessesController < ApplicationController
  def index
    @businesses = nil
  end

  def search
    business_details = {"term" => params[:search][:term], "location" => params[:search][:location]}
    @businesses = Business.search_businesses(business_details)
    render "businesses/index"
  end

  def show
    @business = Business.get_yelp_business_details(params[:id])
    @testimonial = Testimonial.new
    @testimonials = Testimonial.where(yelp_id: params[:id])
    @vote = Vote.new
  end
end
