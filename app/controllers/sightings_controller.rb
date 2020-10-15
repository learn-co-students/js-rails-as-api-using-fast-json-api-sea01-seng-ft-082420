class SightingsController < ApplicationController

  def index
    sightings = Sighting.all
    options = {
      include: [:bird, :location]
    }
    render json: SightingSerializer.new(sightings,options)
  end

  def show
    sighting = Sighting.find(params[:id])
    options = {
      include: [:bird, :location]
    }
    # render json: sighting.to_json(:include => {:bird => {:only =>[:name, :species]}, :location => {:only =>[:latitude, :longitude]}}, :except => [:updated_at])
    render json: SightingSerializer.new(sighting,options)
  end
end
