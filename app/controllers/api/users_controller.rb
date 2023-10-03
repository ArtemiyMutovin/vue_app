class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  def index
    render json: UserSerializer.render_as_json(User.all)
  end

  def create
    result = Users::CreateService.new(user_params).call

    if result.user.persisted?
      render json: UserSerializer.render_as_json(result.user), status: :created
    else
      render json: { errors: result.user.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:fullname, :email, :phone, :password)
  end
end
