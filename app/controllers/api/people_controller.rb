class Api::PeopleController < ApplicationController
  respond_to :json

  def index
    # serialized_people =
    #   ActiveModel::ArraySerializer
    #            .new(Team.where(name: params[:team]).first.people, each_serializer: PeopleSerializer)

    serialized_people =
      ActiveModel::ArraySerializer
               .new(Person.all.order(is_supervisor: :desc, each_serializer: PeopleSerializer))



    render json: serialized_people
  end
end