require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'Title and content should have at least 3 characters' do
    it { should validate_length_of(:title).is_at_least 3 }
    it { should validate_length_of(:title).is_at_most 30 }
    it { should validate_length_of(:text).is_at_least 10 }
    it { should validate_length_of(:text).is_at_most 225 }
  end

  describe 'Check the presence of columns' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
  
  context 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:avatar) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:category_id) }
    it { should_not allow_value('it').for(:title) }
    it { should_not allow_value('post').for(:text) }
  end
end
