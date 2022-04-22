require 'rails_helper'

RSpec.describe 'group', type: :feature do
  describe 'new page' do
    before(:each) do
      visit user_session_path
      aku = User.create!(name: 'aku', email: 'aku@gmail.com', password: '123456', password_confirmation: '123456')
      category = Category.create!(name: 'Categories', icon: 'budget.png', user_id: aku.id)
      Expenditure.create!(name: 'fund1', amount: 20, id: 1, user_id: aku.id, category_id: category.id)
      within('#new_user') do
        fill_in 'Email', with: 'aku@gmail.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
      expect(page).to have_content('Categories')
      click_link 'aku'
      expect(page).to have_current_path category_expenditures_path(category.id)
    end

    it 'Fund page have the right content New expenditure' do
      expect(page).to have_content('Add New expenditure')
    end

    it 'Funding page have the right Expenditure' do
      expect(page).to have_content('fund1')
    end

    it 'Funding page have the right Expenditure' do
      expect(page).to have_content('Expenditure')
    end

    it 'Funding page have the right Expenditure amount' do
      expect(page).to have_content('20')
    end
  end
end
