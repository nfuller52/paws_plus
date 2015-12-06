require 'rails_helper'

RSpec.feature 'Vet sign up', type: :feature do
  let!(:state) { State.create(abbreviation: 'MA', name: 'Massachusetts') }

  scenario 'successfully creates a new account' do
    email = default_vet_fields[:email]
    password = default_vet_fields[:password]

    vet_registers_with(default_vet_fields)

    vet = Vet.order(created_at: :desc).limit(1).first

    expect(vet.email).to eq('tbrady@patriots.com')
    expect(vet.first_name).to eq('Tom')
    expect(vet.last_name).to eq('Brady')
    expect(vet.address).to eq('1 Patriot Pl')
    expect(vet.address_2).to eq('Apt 44')
    expect(vet.city).to eq('Foxborough')
    expect(vet.state).to eq('MA')
    expect(vet.zip).to eq('02035')

    vet_should_confirm_email(email)
    sign_in_as_vet(email, password)
  end

  scenario 'fails without their email address' do
    vet_registers_with(default_vet_fields.merge email: '')
    expect(page).to have_content("Email can't be blank")
  end

  scenario 'fails without their first name' do
    vet_registers_with(default_vet_fields.merge first_name: '')
    expect(page).to have_content("First name can't be blank")
  end

  scenario 'fails without their last name' do
    vet_registers_with(default_vet_fields.merge last_name: '')
    expect(page).to have_content("Last name can't be blank")
  end

  scenario 'fails without their address' do
    vet_registers_with(default_vet_fields.merge address: '')
    expect(page).to have_content("Address can't be blank")
  end

  scenario 'successfully creates a new account without an address 2' do
    email = default_vet_fields[:email]
    password = default_vet_fields[:password]

    vet_registers_with(default_vet_fields.merge address_2: '')
    vet_should_confirm_email(email)
    sign_in_as_vet(email, password)
  end

  scenario 'fails without their city' do
    vet_registers_with(default_vet_fields.merge city: '')
    expect(page).to have_content("City can't be blank")
  end

  scenario 'fails without their state' do
    vet_registers_with(default_vet_fields.merge state: 'Select a State')
    expect(page).to have_content("State can't be blank")
  end

  scenario 'fails without their zip' do
    vet_registers_with(default_vet_fields.merge zip: '')
    expect(page).to have_content("Zip can't be blank")
  end

  ## Support Methods
  ###############################################

  def vet_registers_with(fields)
    visit new_vet_registration_path

    fill_in_vet_registration_form_with(fields)
    click_button 'Sign up'
  end

  def vet_should_confirm_email(email_address)
    expect(page).to have_content('A message with a confirmation link has been sent to your email address.')
    expect(unread_emails_for(email_address)).to be_present

    open_email(email_address, with_subject: 'PawsPlus Confirmation Instructions')
    click_first_link_in_email

    expect(page).to have_content('Your email address has been successfully confirmed.')
  end

  # rubocop:disable AbcSize
  def fill_in_vet_registration_form_with(fields)
    fill_in 'Email', with: fields[:email]
    fill_in 'First name', with: fields[:first_name]
    fill_in 'Last name', with: fields[:last_name]
    fill_in 'Address', with: fields[:address]
    fill_in 'Address 2', with: fields[:address_2]
    fill_in 'City', with: fields[:city]
    select fields[:state], from: 'State'
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
      address_2: 'Apt 44',
      city: 'Foxborough',
      state: 'Massachusetts',
      zip: '02035',
      password: 'password',
      password_confirmation: 'password' }
  end
end
