class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :ticket, class_name: "TicketType"
end
