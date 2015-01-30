class Api::TeamsController < ApplicationController
  respond_to :json

  def index
  	puts "#{params['epi_code']} !!!!"
    serialized_teams =
      ActiveModel::ArraySerializer
               .new(Team.all.select{|t| t.epi_codes.include?(params['epi_code'])}, each_serializer: TeamSerializer)

    render json: serialized_teams
  end
end