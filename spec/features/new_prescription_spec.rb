require 'rails_helper'

RSpec.describe 'Create Prescription', type: :feature do
  before(:each) do
    create(:category)
    @doctor = create(:doctor)
    @user = create(:user)
    @appointment = create(:appointment)
    create(:prescription)

    visit new_doctor_session_path
    fill_in 'Phone', with: @doctor.phone
    fill_in 'Password', with: @doctor.password
    click_button 'Log in'
    visit doctor_path(@doctor.id)
    click_link('Write a prescript')
  end

  describe 'prescriptions#new' do
    it 'adds data to the form and sucessufully submits' do
      visit new_prescription_path
      fill_in 'Prescript', with: 'Ipsum Ipsum Ipsum'
      click_on 'Submit'
      expect(page).to have_field('prescript')
    end
  end
end
