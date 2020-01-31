require 'rest-client'
require 'json'

class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET
  def index
    response = RestClient.get 'http://localhost:3000/locations'
    @locations = response.body
    @locations = JSON.parse(@locations)
    render :index
  end

  # GET
  def show
    response = RestClient.get("http://localhost:3000/locations/#{params[:id]}")
    @location = response.body
    @location = JSON.parse(@location)
    response = RestClient.get("http://localhost:3000/locations/#{params[:id]}/parks")
    @parks = response.body
    @parks = JSON.parse(@parks)
    render :show
  end

  # GET
  def new
    @location = Location.new
  end

  # GET
  def edit
    response = RestClient.get("http://localhost:3000/locations/#{params[:id]}")
    @location = response.body
    @location = JSON.parse(@location)
    @location = Location.new(id: @location["id"], continent: @location['continent'], country: @location["country"], city: @location["city"], community: @location['community'], street_address: @location['street_address'], longitude: @location['longitude'], latitude: @location['latitude'])
    render :edit
  end

  # POST
  def create
    @location = RestClient.post("http://localhost:3000/locations/", {
      continent: location_params['continent'], 
      country: location_params['country'], 
      city: location_params['city'],
      community: location_params['community'],
      street_address: location_params['street_address'],
      longitude: location_params['longitude'],
      latitude: location_params['latitude'],
      })
    respond_to do |format|
      binding.pry
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT
  def update
    response = RestClient.put("http://localhost:3000/locations/#{params[:id]}")
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE
  def destroy
      response = RestClient.delete("http://localhost:3000/locations/#{params[:id]}")
      respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      response = RestClient.get("http://localhost:3000/locations/#{params[:id]}")
      @location = response.body
      @location = JSON.parse(@location)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:continent, :country, :city, :community, :street_address, :longitude, :latitude)
    end
end
