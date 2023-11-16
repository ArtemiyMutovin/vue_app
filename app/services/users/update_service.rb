class Users::UpdateService
  attr_reader :user

  def initialize(user:, params:, organizations: [])
    @user = user
    @params = params
    @user_organizations = organizations
  end

  def call
    update_user
    create_user_organizations
    self
  end

  private

  def update_user
    @user.update(@params)
  end

  def create_user_organizations
    @user.organizations.destroy_all if @user.organizations.present?
    @user_organizations.each do |organization|
      UserOrganization.create(user_id: @user.id, organization_id: organization['id'])
    end
  end
end
