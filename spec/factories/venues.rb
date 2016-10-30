FactoryGirl.define do
  factory :venue do
    name "My Dinh"
    region_id FactoryGirl.create(:region).id
  end
end