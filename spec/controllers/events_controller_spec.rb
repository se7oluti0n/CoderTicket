require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe "upcoming events" do
    it "display upcoming events" do
      event = Event.create name: "Example Event", starts_at: 3.days.ago, ends_at: 2.days.from_now, published_at: Time.now, extended_html_description: "Helleo", venue: Venue.new, category: Category.new 
      get :index
      expect(assigns(:events)).to eq [event] 
    end 
  end

  describe "Create events" do
    it "can not create event when not login" do
      post :create
      expect(flash[:error]).to be_present
    end

    it "can create event when login with full params" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in user

      region = FactoryGirl.create(:region)
      category = FactoryGirl.create(:category)
      post :create, { :name => "Events", :starts_at => "Oct 31 2016", :ends_at => "Dec 31 2016", :hero_image_url => "123",
                      :venue_name => "Vuene", :address => "tam trinh", :region => region.id, :category => category.id }

      expect(flash[:success]).to be_present
    end
   
  end

  describe "Publish event" do
    it "no published when not enough ticket type" do
      event =  event = Event.create name: "Pblish Event", starts_at: 3.days.ago, ends_at: 2.days.from_now, published_at: Time.now, extended_html_description: "Helleo", venue: Venue.new, category: Category.new 
      get :publish, :event_id => event.id
      expect(flash[error]).to be_present 
    end
    it "no published when not the event owner" do
      
    end
    it "can publish when have enough ticket type and not  publised yet"
    it "can not publish again when published"
  end
end
