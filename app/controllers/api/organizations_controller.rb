class Api::OrganizationsController < ApplicationController
  before_action :organization, only: %i[destroy update]
  def index
    render json: OrganizationSerializer.render_as_json(Organization.all)
  end

  def create
    result = Organizations::CreateService.new(organization_params).call

    if result.organization.persisted?
      render json: OrganizationSerializer.render_as_json(result.organization), status: :created
    else
      render json: { errors: result.organization.errors.messages }, status: :unprocessable_entity
    end
  end

  def update
    result = Organizations::UpdateService.new(organization, organization_params).call

    if result.organization.errors.empty?
      render json: OrganizationSerializer.render_as_json(result.organization), status: :ok
    else
      render json: { errors: result.organization.errors.messages }, status: :unprocessable_entity
    end
  end

  def destroy
    organization.destroy
    head :no_content
  end

  private

  def organization
    @organization ||= Organization.find(params[:id])
  end

  def organization_params
    params.require(:organization).permit(:name, :org_type, :inn, :ogrn)
  end
end
