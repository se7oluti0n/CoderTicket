require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
  describe "OrderDetail" do
    it "order quantity must greater than 0" do
      order_detail = OrderDetail.new ticket: TicketType.new, order: Order.new, quantity: 0
      expect(order_detail.save).to eq false
    end
  end

  
end
