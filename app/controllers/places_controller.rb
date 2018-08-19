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
end
