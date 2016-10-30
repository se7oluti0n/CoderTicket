require 'rails_helper'

RSpec.describe "events", :type => :routing do
  it "routes /upcoming to events#index" do
    expect(:get => "/upcoming").to route_to(
      :controller => "events",
      :action => "index"
    )
  end

  it "routes /events/mine to EventsController " do
  	expect(:get => "/events/mine").to route_to(
  		:controller => "events",
  		:action => "mine"
  	)
  end

    it "routes /events/1/publish to EventsController " do
  	expect(:get => "/events/1/publish").to route_to(
  		:controller => "events",
  		:action => "publish",
  		:id => "1"
  	)
  end

end