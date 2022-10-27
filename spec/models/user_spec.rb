require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'valid factory' do
    describe ':user' do
      subject(:factory) { build(:user) }

      it { is_expected.to be_valid }
    end
  end

  describe 'associations' do 
    it { is_expected.to have_many :articles }
    it { is_expected.to have_many :comments }
  end

  # describe 'validations' do 
  #   subject { build(:user) }

  #   it { is_expected.to  validate_presence_of(:body) }
  #   it { is_expected.to  validate_presence_of(:commenter) }
  # end

  
end
