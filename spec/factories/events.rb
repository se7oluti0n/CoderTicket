FactoryGirl.define do
  factory :event do
   starts_at 2.days.ago
   ends_at 3.days.from_now
   name "Halloween party"
   extended_html_description "Halloweeen"
  end
end
