class Api::V1::HikesController < ActionController::API

  def index
    render status: 201, json: "test"
  end

end
