class Api::TeamsController < ApplicationController
  respond_to :json

  def index

    Track.create(ip: request.remote_ip, params: params)
    # serialized_teams =
    #   ActiveModel::ArraySerializer
    #            .new(Team.all.select{|t| t.epi_codes.include?(params['epi_code'])}, each_serializer: TeamSerializer)

    if current_user
      if can_view?
        serialized_teams = Team.teams_people
      else
        serialized_teams = Team.teams_people_no_contact
      end
    else
      serialized_teams = Team.teams_people_no_contact
    end
      
    render json: serialized_teams

  end
end