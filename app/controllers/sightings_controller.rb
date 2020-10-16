class SightingsController < ApplicationController
  def index
    sightings = Sighting.all
    render json: SightingSerializer.new(sightings)
  end
  
  def show
    sighting = Sighting.find_by(id: params[:id])
    options = {
      include: [:bird, :location]
  }
    render json: JSON.pretty_generate(SightingSerializer.new(sighting, options).as_json)
  end
end
