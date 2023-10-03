class Users::CreateService

  attr_reader :user

  def initialize(params)
    @params = params
  end

  def call
    create_user
    self
  end

  private

  def create_user
    @user = User.create(@params)
  end
end
