require 'rails_helper'

RSpec.describe 'Create Prescription', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let(:valid_attributes) do
        create(:category)
        create(:doctor)
        create(:user)
        create(:appointment)
        create(:prescription)
      end

      it 'creates a new Prescription' do
        expect do
          post prescriptions_url, params: { prescription: valid_attributes }
        end.to change(Prescription, :count).by(1)
      end
    end
  end
end
