class Api::ZonesController < ApplicationController
  respond_to :json

  def index
    render json: Zone.zone_table
  end
end