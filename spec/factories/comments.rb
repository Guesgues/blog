FactoryBot.define do
  factory :comment do
    body { 'test test' }
    commenter { 'Hello' }
    article { create(:article) }
  end
end
