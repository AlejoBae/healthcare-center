require 'rails_helper'

RSpec.describe Appointment, type: :model do
  subject do
    create(:user)
    create(:category)
    create(:doctor)
    create(:appointment)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
