require 'rails_helper'

feature 'User submits twitter handle' do
  scenario 'with valid handle' do
    user = create(:user)
    login_as(user, :scope => :user, :run_callbacks => false)
    visit '/twitter'
    fill_in 'handle', with: 'justinbieber'
    click_on 'get_tweets'
    expect(page).to have_content('Tweets From justinbieber')
  end
end