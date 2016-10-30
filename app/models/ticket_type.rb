class TicketType < ActiveRecord::Base
  belongs_to :event
  
  validates :max_quantity, numericality: { greater_than: 0 }
  validates_presence_of :name, :price, :max_quantity, :event
  validates_uniqueness_of :name, :scope => :event


  has_many :sold_tickets, foreign_key: 'ticket_id', class_name: 'OrderDetail'

  def available
  	max_quantity - sold_tickets.inject(0) { |sum, x| sum + x.quantity }
  end
  
  def self.orderAvailable(ticket_details)
    sum = 0
    ticket_details.each do |ticket_id, quantity|
      ticket_type = find ticket_id
      sum += quantity.to_i
      if quantity.to_i > ticket_type.available or quantity.to_i > 10
        return false
      end
    end

    if sum == 0
      false
    else
      true
    end 
  end
end
