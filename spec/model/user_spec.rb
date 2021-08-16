require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'username and name should have at least 3 characters' do
    it { should validate_length_of(:name).is_at_least 3 }
    it { should validate_length_of(:name).is_at_most 30 }
  end

  describe 'username and name should be filled in' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:articles) }
  end
end
