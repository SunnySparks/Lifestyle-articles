require 'rails_helper'
RSpec.feature 'Authentications', type: :feature do
  let(:user) do
    User.create(name: 'Johndoe')
  end
  let(:category) do
    Category.create(name: 'travel',
                     priority: 1)
  end


  describe 'Category Page' do
    before do
      visit root_path
    end
  end
end