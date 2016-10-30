require 'rails_helper'

RSpec.describe "orders", :type => :routing do
  it "routes /events/:id/orders/new to orderss#index" do
    expect(:get => "/events/1/orders/new").to route_to(
      :controller => "orders",
      :action => "new",
      :event_id => "1"
    )
  end
end