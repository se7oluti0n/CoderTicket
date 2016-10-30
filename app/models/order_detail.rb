class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :ticket, class_name: "TicketType"

  validates_presence_of :ticket, :order, :quantity
  #validates_uniqueness_of :order_id, :scope => :ticket_id

  validates :quantity,numericality: { greater_than: 0 }
end
