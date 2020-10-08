class SightingsController < ApplicationController
  def index
    sightings = Sighting.all
    render json: sightings, include: %i[bird location]
  end

  # def show
  #   sighting = Sighting.find_by(id: params[:id])
  #   # render json: sighting
  #   render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }
  #   # render json: sighting, include: [:bird, :location]
  # end
  def show
    sighting = Sighting.find_by(id: params[:id])
    if sighting
      render json: sighting.to_json(include: %i[bird location])
    else
      render json: { message: 'No sighting found with that id' }
    end
  end

  # def show
  #   sighting = Sighting.find_by(id: params[:id])
  #   render json: sighting.to_json(:include => {
  #    :bird => {:only => [:name, :species]},
  #    :location => {:only => [:latitude, :longitude]}
  #  }, :except => [:updated_at])
  # end
end
