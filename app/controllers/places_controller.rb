require 'open-uri'


class PlacesController < ApplicationController
  def index

    @places = Place.all

    render("place_templates/index.html.erb")
  end

  def show
    @place = Place.find(params.fetch("id_to_display"))

    render("place_templates/show.html.erb")
  end

  def new_form
    render("place_templates/new_form.html.erb")
  end

  def create_row
    @place = Place.new

    @place.name = params.fetch("name")
    @place.address = params.fetch("address")
    @place.description = params.fetch("description")
    @place.lat = params.fetch("lat")
    @place.lng = params.fetch("lng")
    @place.owner_id = params.fetch("owner_id")
    @place.city = params.fetch("city")

    if @place.valid?
      @place.save

      redirect_to("/places", :notice => "Place created successfully.")
    else
      render("place_templates/new_form.html.erb")
    end
  end

  def edit_form
    @place = Place.find(params.fetch("prefill_with_id"))

    render("place_templates/edit_form.html.erb")
  end

  def update_row
    @place = Place.find(params.fetch("id_to_modify"))

    @place.name = params.fetch("name")
    @place.address = params.fetch("address")
    @place.description = params.fetch("description")
    @place.lat = params.fetch("lat")
    @place.lng = params.fetch("lng")
    @place.owner_id = params.fetch("owner_id")
    @place.city = params.fetch("city")

    if @place.valid?
      @place.save

      redirect_to("/places/#{@place.id}", :notice => "Place updated successfully.")
    else
      render("place_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @place = Place.find(params.fetch("id_to_remove"))

    @place.destroy

    redirect_to("/places", :notice => "Place deleted successfully.")
  end
  
  def search_form
  
  render("place_templates/new_form.html.erb")
  end
  
  
  def search_results
    
    api_key = "AIzaSyCO71x5mCr7o7E7QjV3gxC00u4qxdedNt4"
        
    @search_term = params.fetch("search_term")
    @city = params.fetch("city")
    url_safe_search_term = URI.encode(@search_term)
    url_safe_city = URI.encode(@city)

    complete_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query="+url_safe_search_term.gsub(/%20/, "+")+"+in+"+url_safe_city.gsub(/%20/, "+")+"&key="+api_key

    @parsed_data = JSON.parse(open(complete_url).read)

    @name = @parsed_data.dig("results",0,"name")
  
    @address = @parsed_data.dig("results",0,"formatted_address")
    
    @lat = @parsed_data.dig("results",0,"geometry","location","lat")
    
    @lng = @parsed_data.dig("results",0,"geometry","location","lng")
    
    render("place_templates/results.html.erb")
  end
  
  
    def feed
    
    @places = Place.where(owner_id: current_user.sent_follow_requests.pluck(:recipient_id))
    
    render("place_templates/feed.html.erb")
    end
  
end
