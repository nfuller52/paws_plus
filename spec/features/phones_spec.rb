require 'rails_helper'

RSpec.feature 'Phones', type: :feature do
  let(:vet) { create(:vet) }

  scenario 'vet can create a phone number' do
    sign_in_as_vet(vet.email)

    visit edit_vet_registration_path

    click_button 'Add phone'

    fill_in 'Phone number', with: '8008888908'
    select 'Mobile', from: 'Type'

    click_button 'Save'

    expect(page).to have_content('Phone successfully created')
    expect(page).to have_content('(800) 888-8908')
  end
end
