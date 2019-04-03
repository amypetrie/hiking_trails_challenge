class Api::V1::HikesController < ActionController::API

  def index
    all_hikes = Hike.all.order(id: :asc)
    render status: 201, json: HikeSerializer.new(all_hikes)
  end

end
