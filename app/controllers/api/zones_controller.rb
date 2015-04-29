class Api::ZonesController < ApplicationController
  respond_to :json

  def index
  	sleep 1
    #render json: Zone.zone_table
      serialized_zones =
        ActiveModel::ArraySerializer
                 .new(Zone.all, each_serializer: ZoneSerializer)

      render json: serialized_zones
  end
end