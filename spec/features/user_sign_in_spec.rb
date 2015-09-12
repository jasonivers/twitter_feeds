require 'rails_helper'

feature 'User signs in' do
  scenario 'with valid credentials' do
    visit '/users/sign_in'
    user = create(:user)
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'sign_in'

    expect(page).to have_content('Signed in successfully')
  end
end