class Api::FacilitiesController < ApplicationController
  respond_to :json

  def index
    serialized_facilities =
      ActiveModel::ArraySerializer
                 .new(Facility.all, each_serializer: FacilitySerializer)

      render json: serialized_facilities
  end
end