require 'rails_helper'
require 'ffaker'
feature 'User signs in' do
  scenario 'with valid credentials' do
    visit '/users/sign_up'
    fill_in 'user_email', with: FFaker::Internet.email
    fill_in 'user_name', with: FFaker::Name.name
    password = FFaker::Internet.password
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password
    click_on 'sign_up'

    expect(page).to have_content('You have signed up successfully')
  end
end