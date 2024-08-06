require 'rails_helper'

RSpec.describe Prescription, type: :model do
  subject do
    create(:category)
    create(:doctor)
    create(:user)
    create(:appointment)
    create(:prescription)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
