FactoryGirl.define do
  factory :event do
   starts_at "Sep 21 2016 00:00:00" 
   ends_at "Oct 31 2016 23:59:59"
   name "Halloween party"
   extended_html_description "Halloweeen"
   venue_id "1"
   category_id "1"
  end
  factory :venue do
    name "My Dinh"
    region_id 1
  end

  factory :category do
    name "Entertainment"
  end

  factory :region do
    name "Ho Chi Minh"
  end
end
