require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "Upcomming event" do
    it "return [] when there are only past events" do
      Event.create!(starts_at: 2.days.ago, ends_at: 1.day.ago, extended_html_description: " a past event",
                    venue: Venue.new, category: Category.new)
      expect(Event.upcoming_events).to eq []
    end

    it "return [b] when there are a past event 'a' and a future event 'b'" do
      a = Event.create!(name: "a", starts_at: 2.days.ago, ends_at: 1.day.ago, extended_html_description: "a past event",
                        venue: Venue.new, category: Category.new)
      b = Event.create!(name: "b", starts_at: 2.days.ago, ends_at: 1.day.from_now, extended_html_description: " a future event",
                        venue: Venue.new, category: Category.new)
      expect(Event.upcoming_events).to eq [b]
    end

    describe "Publishing event" do
      it "return if no datetime in published_at" do
        a = Event.create!(name: "a", starts_at: 2.days.ago, ends_at: 1.day.ago, extended_html_description: "a past event",
                          venue: Venue.new, category: Category.new)
        expect(Event.published).to eq []
      end
    end
  end 
end
