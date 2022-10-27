require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'valid factory' do
    describe ':comment' do
      subject(:factory) { build(:comment) }

      it { is_expected.to be_valid }
    end
  end

  describe 'associations' do 
    it { is_expected.to belong_to :article }
    # it { is_expected.to have_many :comments }
  end

  describe 'validations' do 
    subject { build(:comment) }

    it { is_expected.to  validate_presence_of(:body) }
    it { is_expected.to  validate_presence_of(:commenter) }
  end

  
end
