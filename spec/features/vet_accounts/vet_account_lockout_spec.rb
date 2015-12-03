require 'rails_helper'

RSpec.feature 'Vet account lockout', type: :feature do
  let(:vet) { create(:vet, failed_attempts: 9) }

  scenario 'when vet fails to login 10 times' do
    vet_failed_login_attempt(vet)

    expect(page).to have_content("Your account is locked.")
  end

  scenario 'displays a warning on the 10th try' do
    vet = create(:vet, failed_attempts: 8)

    vet_failed_login_attempt(vet)

    expect(page).to have_content("You have one more attempt before your account is locked.")
  end

  scenario 'unlocks when verified via email' do
    vet_failed_login_attempt(vet)
    expect(page).to have_content("Your account is locked.")

    open_email(vet.email, with_subject: 'Unlock instructions')
    click_first_link_in_email

    expect(page).to have_content("Your account has been unlocked successfully. Please sign in to continue.")
  end

  def vet_failed_login_attempt(vet)
    visit new_vet_session_path

    fill_in 'Email', with: vet.email
    fill_in 'Password', with: 'invalidPassword'

    click_button 'Log in'
  end
end
