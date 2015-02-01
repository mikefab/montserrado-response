class Api::PeopleController < ApplicationController
  respond_to :json

  def index
    Track.create(ip: request.remote_ip, params: params)
    serialized_people =
      ActiveModel::ArraySerializer
               .new(Team.where(name: params[:team]).first.people, each_serializer: PeopleSerializer)

    render json: serialized_people
  end
end