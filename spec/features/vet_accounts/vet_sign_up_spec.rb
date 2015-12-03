require 'rails_helper'

RSpec.feature 'Vet sign up', type: :feature do
  scenario 'Vet successfully creates a new account' do
    vet_registers_with(default_vet_fields)
    expect(page).to have_content('Welcome Doctor! You have signed up successfully.')
  end

  scenario 'Vet omits their email address' do
    vet_registers_with(default_vet_fields.merge email: '')
    expect(page).to have_content("Email can't be blank")
  end

  scenario 'Vet omits their first name' do
    vet_registers_with(default_vet_fields.merge first_name: '')
    expect(page).to have_content("First name can't be blank")
  end

  scenario 'Vet omits their last name' do
    vet_registers_with(default_vet_fields.merge last_name: '')
    expect(page).to have_content("Last name can't be blank")
  end

  scenario 'Vet omits their address' do
    vet_registers_with(default_vet_fields.merge address: '')
    expect(page).to have_content("Address can't be blank")
  end

  scenario 'Vet omits their address 2' do
    vet_registers_with(default_vet_fields.merge address_2: '')
    expect(page).to have_content('Welcome Doctor! You have signed up successfully.')
  end

  scenario 'Vet omits their city' do
    vet_registers_with(default_vet_fields.merge city: '')
    expect(page).to have_content("City can't be blank")
  end

  scenario 'Vet omits their state' do
    vet_registers_with(default_vet_fields.merge state: 'Select a State')
    expect(page).to have_content("State can't be blank")
  end

  scenario 'Vet omits their zip' do
    vet_registers_with(default_vet_fields.merge zip: '')
    expect(page).to have_content("Zip can't be blank")
  end

  ## Support Methods
  ###############################################

  def vet_registers_with(fields)
    visit new_vet_registration_path

    fill_in_vet_form_with(fields)
    click_button 'Sign up'
  end

  # rubocop:disable AbcSize
  def fill_in_vet_form_with(fields)
    fill_in 'Email', with: fields[:email]
    fill_in 'First name', with: fields[:first_name]
    fill_in 'Last name', with: fields[:last_name]
    fill_in 'Address', with: fields[:address]
    fill_in 'Address 2', with: fields[:address_2]
    fill_in 'City', with: fields[:city]
    # select(fields[:state], from: 'vet[state]') # THIS IS BROKEN
    within '#vet_state' do
      find("options[value='#{fields[:state]}']").click
    end

    fill_in 'Zip', with: fields[:zip]
    fill_in 'Password', with: fields[:password]
    fill_in 'Password confirmation', with: fields[:password_confirmation]
  end
  # rubocop:enable AbcSize

  def default_vet_fields
    { email: 'tbrady@patriots.com',
      first_name: 'Tom',
      last_name: 'Brady',
      address: '1 Patriot Pl',
      address_2: nil,
      city: 'Foxborough',
      state: 'MA',
      zip: '02035',
      password: 'password',
      password_confirmation: 'password' }
  end
end
