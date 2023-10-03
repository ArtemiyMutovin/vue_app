require 'rails_helper'

RSpec.describe Users::CreateService do
  subject(:service) { described_class.new(user_params).call }

  let(:user_params) do
    {
      fullname: "User1",
      email: "user1@mail.com",
      phone: "123456789",
      password: "123456"
    }
  end

  context 'when valid params' do
    it 'creates a new user' do
      expect { service }.to change(User, :count).from(0).to(1)
    end

    it 'returns the created user' do
      expect(service.user).to be_an_instance_of(User)
    end
  end

  context 'when invalid params' do
    let(:user_params) do
      {
        fullname: "",
        phone: "",
        email: "",
        password: ""
      }
    end

    it 'does not create a new user' do
      expect { service }.not_to change(User, :count)
    end
  end
end
