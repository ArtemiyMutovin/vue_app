class Api::UsersController < ApplicationController
  before_action :user, only: %i[destroy update]
  def index
    render json: UserSerializer.render_as_json(User.all)
  end

  def create
    result = Users::CreateService.new(user_params).call

    if result.user.persisted?
      render json: UserSerializer.render_as_json(result.user), status: :created
      flash[:notice] = 'User was succesfully created'
    else
      render json: { errors: result.user.errors.messages }, status: :unprocessable_entity
    end
  end

  def update
    result = Users::UpdateService.new(user, user_params).call

    if result.user.errors.empty?
      render json: UserSerializer.render_as_json(result.user), status: :ok
    else
      render json: { errors: result.user.errors.messages }, status: :unprocessable_entity
    end
  end
  def destroy
    user.destroy
    head :no_content
  end

  private

  def user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:fullname, :email, :phone, :password)
  end
end
