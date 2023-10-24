require 'rails_helper'

RSpec.describe Organizations::UpdateService do
  subject(:service) { described_class.new(organization, organization_params).call }

  let!(:organization) { create(:organization) }
  let(:organization_params) do
    {
      name: 'New Organization'
    }
  end

  context 'when valid params' do
    it 'updates name' do
      service
      expect(organization.name).to eq(organization_params[:name])
    end
  end

  context 'when not valid data' do
    context 'when wrong organization data' do
      let(:organization_params) do
        {
          name: ' '
        }
      end

      it 'not updates organization' do
        name = organization.name
        service
        expect(organization.reload.name).to eq(name)
      end
    end
  end
end
