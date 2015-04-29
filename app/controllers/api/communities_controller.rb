class Api::CommunitiesController < ApplicationController
  respond_to :json

  def index
    serialized_communities =
      ActiveModel::ArraySerializer
                 .new(Community.all, each_serializer: CommunitySerializer)

      render json: serialized_communities
  end
end