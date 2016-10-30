require 'rails_helper'

RSpec.describe TicketType, type: :model do
  describe "Available tickets" do
    it "Max quantity is 50 and already sold 20 ( 10 pairs) , availabe is 3	0" do
      ticket_type = TicketType.create!(event: Event.new, max_quantity: 50, name: "new type", price: 40000)
      10.times {OrderDetail.create!(ticket: ticket_type, quantity: 2, order: Order.new)}

      expect(ticket_type.available).to eq 30
    end

    it "Order 10 ticket but only have 5" do
      ticket_type = TicketType.create!(event: Event.new, max_quantity: 5, name: "new type", price: 40000)
      request = { ticket_type.id => "10"}
      expect(TicketType.orderAvailable(request)).to eq false
    end
  end

  describe "Create ticket_type" do
    it "Name of tickets for an event must be unique" do 
      event = Event.new
      a = TicketType.create! name: "1", price: 400, max_quantity: 5, event: event
      b = TicketType.new name: "1", price: 400, max_quantity: 5, event: event
      expect(b.save).to eq false
    end
    it "Ticket max quantity must be positve" do 
      a = TicketType.new name: "ticket", price: 4000, max_quantity: 0, event: Event.new 

      expect(a.save).to eq false
    end
  end
end
