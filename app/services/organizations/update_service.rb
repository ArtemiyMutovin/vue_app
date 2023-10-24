class Organizations::UpdateService
  attr_reader :organization

  def initialize(organization, params)
    @organization = organization
    @params = params
  end

  def call
    update_organization
    self
  end

  private

  def update_organization
    @organization.update(@params)
  end
end
