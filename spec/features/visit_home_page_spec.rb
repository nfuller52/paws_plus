require 'rails_helper'

RSpec.feature 'Home page', type: :feature do
  scenario 'can be visited by anyone' do
    visit root_path

    expect(page).to have_content 'PawsPlus Homepage'
  end
end
