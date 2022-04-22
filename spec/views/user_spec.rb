require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  describe 'login' do
    before(:each) do
      @user = User.create!(email: 'aku@email.com', name: 'User', password: 'password', id: 1)
      visit '/users/sign_in'
    end

    it 'enter a name' do
      visit user_session_path
      expect(page).to have_content 'LOGIN'
    end

    it 'See input and button fields' do
      visit user_session_path
      expect(page).to have_current_path(user_session_path)
    end

    it 'click the login button and response with error' do
      visit user_session_path
      click_button
      expect(page).to have_content 'Invalid Email or password.'
    end

    it ' User cannot log in with wrong user email and password details' do
      fill_in 'Email', with: 'ak@email.cm'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password'
    end
  end
end
