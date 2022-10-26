# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'valid factory' do
    describe ':article' do
      subject(:factory) { build(:article) }

      it { is_expected.to be_valid }
    end
  end

  describe 'associations' do 
    # it { is_expected.to belong_to :user }
    it { is_expected.to have_many :comments }
  end

  describe 'validations' do 
    subject { build(:article) }

    it { is_expected.to  validate_presence_of(:title) }
    it { is_expected.to  validate_presence_of(:body) }
  end

  describe '#self.hello' do
    subject { described_class.hello }

    it 'return hello' do
      is_expected.to eq 'hello'
    end
  end

  describe '#foo' do
    subject { article.foo }

    let(:article) { create(:article) }

    it 'return bar' do
      is_expected.to eq 'bar'
    end
  end
end
