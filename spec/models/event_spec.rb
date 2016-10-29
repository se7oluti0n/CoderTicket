require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "Upcomming event" do
    it "Upcomming event should not show past event" do
      region = FactoryGirl.create(:region)
      venue = FactoryGirl.create(:venue, region_id: region.id)
      category = FactoryGirl.create(:category)
      event = FactoryGirl.create(:event, ends_at: 'Oct 20 2016 00:00:00', venue_id: venue.id, category_id: category.id)

      expect(Event.up_comming_event).to eq []
    end

    it "Return nothing if no event" do
      expect(Event.up_comming_event).to eq []
    end

    it "Only see event that published"  
    it "Event must have at least one ticket type before published"
  end 
end
