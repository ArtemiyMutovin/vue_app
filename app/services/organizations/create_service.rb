class Organizations::CreateService

  attr_reader :organization

  def initialize(params)
    @params = params
  end

  def call
    create_organization
    self
  end

  private

  def create_organization
    @organization = Organization.create(@params)
  end
end
