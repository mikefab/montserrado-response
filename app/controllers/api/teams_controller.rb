class Api::TeamsController < ApplicationController
  respond_to :json

  def index
    Track.create(ip: request.remote_ip, params: params)
    # serialized_teams =
    #   ActiveModel::ArraySerializer
    #            .new(Team.all.select{|t| t.epi_codes.include?(params['epi_code'])}, each_serializer: TeamSerializer)

    serialized_teams =
      ActiveModel::ArraySerializer
               .new(Team.all, each_serializer: TeamSerializer)

    render json: serialized_teams
  end
end