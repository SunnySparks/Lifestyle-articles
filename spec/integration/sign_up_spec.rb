require 'rails_helper'

feature 'User signs up' do
  let(:user) { User.new(name: 'User Test') }

  scenario 'they see their username in the header' do
    visit new_user_path
    fill_in 'user_name', with: user.name

    click_button 'Create Account'

    expect(page).to have_text user.name
  end

  scenario 'User is prompted to enter a valid username if name is blank' do
    User.create(name: 'User test')
    visit new_user_path
    fill_in 'user_name', with: ''

    click_button 'Create Account'

    expect(current_path).to eq(users_path)
  end

  scenario 'User sees an error if the username is already taken' do
    User.create(name: 'User test')
    visit new_user_path
    fill_in 'user_name', with: ''

    click_button 'Create Account'

    expect(current_path).to eq(users_path)
  end
end

