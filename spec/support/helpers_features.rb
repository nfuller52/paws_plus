def sign_in(email_address, password)
  fill_in 'Email', with: email_address
  fill_in 'Password', with: password
  click_button 'Log in'

  expect(page).to have_content('Signed in successfully.')
end

def sign_in_as_vet(email_address, password)
  visit new_vet_session_path
  sign_in(email_address, password)
end
