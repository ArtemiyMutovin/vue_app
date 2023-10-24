class Users::UpdateService
  attr_reader :user

  def initialize(user, params)
    @user = user
    @params = params
  end

  def call
    update_user
    self
  end

  private

  def update_user
    @user.update(@params)
  end
end
