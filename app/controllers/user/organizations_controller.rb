class User::OrganizationsController < ApplicationController

  def index
    render json: OrganizationSerializer.render_as_json(current_user.organizations)
  end
end
