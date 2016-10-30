module TicketsHelper
  def maxOrderTicket(ticket_type)
    ticket_type.available < 10 ? ticket_type.available : 10
  end
end
