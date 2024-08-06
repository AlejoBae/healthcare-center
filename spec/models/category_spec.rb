require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    create(:category)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
