class Organizations::UpdateService
  attr_reader :organization

  def initialize(org_id, params)
    @org_id = org_id
    @params = params
  end

  def call
    update_organization
    self
  end

  private

  def update_organization
    @organization = Organization.update!(id: @org_id, params: @params)
  end
end
