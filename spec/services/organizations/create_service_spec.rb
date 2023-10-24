require 'rails_helper'

RSpec.describe Organizations::CreateService do
  subject(:service) { described_class.new(organization_params).call }

  let(:organization_params) do
    {
      name: "New Organization",
      org_type: " organization type ",
      inn: "123456789",
      ogrn: "example"
    }
  end

  context 'when valid params' do
    it 'creates a new organization' do
      expect { service }.to change(Organization, :count).from(0).to(1)
    end

    it 'returns the created organization' do
      expect(service.organization).to be_an_instance_of(Organization)
    end
  end

  context 'when invalid params' do
    let(:organization_params) do
      {
        name: "",
        org_type: "",
        inn: "",
        ogrn: ""
      }
    end

    it 'does not create a new organization' do
      expect { service }.not_to change(Organization, :count)
    end
  end
end
