require 'rails_helper'

RSpec.describe Users::UpdateService do
  subject(:service) { described_class.new(user: user, params: user_params, organizations: [organization]).call }

  let!(:user) { create(:user) }
  let!(:organization) { create(:organization) }

  let(:user_params) do
    {
      email: 'newuser@mail.com'
    }
  end

  context 'when valid params' do
    it 'updates email' do
      service
      expect(user.email).to eq(user_params[:email])
    end
  end

  context 'when not valid data' do
    context 'when wrong user data' do
      let(:user_params) do
        {
          email: ' '
        }
      end

      it 'not updates user' do
        email = user.email
        service
        expect(user.reload.email).to eq(email)
      end
    end
  end
end
