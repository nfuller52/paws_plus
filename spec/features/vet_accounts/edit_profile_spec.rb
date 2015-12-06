require 'rails_helper'

RSpec.feature 'Edit vet account', type: :feature do
  let(:vet) { create(:vet) }
  before do
    create(:state, abbreviation: 'CA', name: 'California')
    sign_in_as_vet(vet.email, 'password')
    visit edit_vet_registration_path
  end

  scenario 'fails if a vet does not provide their current password' do
    fill_in 'First name', with: 'Ronald'
    click_button 'Update'

    expect(page).to have_content('we need your current password to confirm your changes')
  end

  scenario 'successfully updates when the vet provides their password' do
    fill_in 'First name', with: 'Ronald'
    fill_in 'Current password', with: 'password'
    click_button 'Update'

    updated_vet = last_vet

    expect(page).to have_content('Your account has been updated successfully.')
    expect(updated_vet.first_name).to eq('Ronald')
  end

  scenario 'requires email verification when email has changed' do
    new_email = 'vadar@empire.com'

    fill_in 'Email', with: new_email
    fill_in 'Current password', with: 'password'
    click_button 'Update'

    expect(page).to have_content('we need to verify your new email address')

    open_email(new_email, with_subject: 'PawsPlus Confirmation Instructions')
    click_first_link_in_email

    expect(page).to have_content('Your email address has been successfully confirmed.')
  end

  scenario 'does not allow for account cancelations' do
    expect(page).to_not have_content('Cancel my account')
    expect(page).to_not have_button('Cancel my account')
  end

  scenario 'allows all fields to be updated' do
    fill_in 'First name', with: 'Ronald'
    fill_in 'Last name', with: 'McDonald'
    fill_in 'Address', with: '123 Memory Ln.'
    fill_in 'Address 2', with: 'Apt. 3'
    fill_in 'City', with: 'San Francisco'
    select 'California', from: 'State'
    fill_in 'Zip', with: '94960'
    fill_in 'Current password', with: 'password'

    click_button 'Update'

    expect(page).to have_content('Your account has been updated successfully.')

    vet = last_vet

    expect(vet.first_name).to eq('Ronald')
    expect(vet.last_name).to eq('McDonald')
    expect(vet.address).to eq('123 Memory Ln.')
    expect(vet.address_2).to eq('Apt. 3')
    expect(vet.city).to eq('San Francisco')
    expect(vet.state).to eq('CA')
    expect(vet.zip).to eq('94960')
  end

  def last_vet
    Vet.order(created_at: :desc).limit(1).first
  end
end
