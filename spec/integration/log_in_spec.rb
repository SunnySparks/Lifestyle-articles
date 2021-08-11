require 'rails_helper'

feature 'User login' do

  let(:user) { User.create(name: 'User Test') }

  scenario 'user sees their username in the header' do
    visit login_url
    
    fill_in 'name', with: user.name
    click_button 'Log In'

    expect(page).to have_text user.name
  end

  scenario 'user is prompted to enter a valid username if the username is empty' do
    visit login_url
    fill_in 'name', with: ''
    
    click_button 'Log In'

    expect(current_path).to eq(root_path)
  end

  scenario 'user is prompted to enter a valid username if the username is wrong' do
    visit login_url
    fill_in 'name', with: 'xsadsadsa'
    
    click_button 'Log In'

    expect(current_path).to eq(root_path)
  end
end