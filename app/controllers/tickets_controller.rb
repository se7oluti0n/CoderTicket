class TicketsController < ApplicationController
	def new
		@event = Event.find params[:event_id]
		@ticket = TicketType.new
	end

	def create
		@event = Event.find params[:event_id]

		@ticket_type = @event.ticket_types.create! ticket_params

		if @ticket_type.save
			flash[:success] = "Add ticket success"
			redirect_to new_event_ticket_path(@event)
		else
			flash[:error] = "Failed to add"
		end

	end
	def index
		@event = Event.find(params[:event_id])
	end

	def destroy
		@ticket = TicketType.find params[:id]
		@event = Event.find params[:event_id]
		if @ticket.sold_tickets.count > 0
			flash[:error] = "This ticket already sold, you can not just delete it, contact admin"
		else 
			@ticket.destroy
			flash[:success] = "Delete ticket types"
		end 

		redirect_to new_event_ticket_path(@event)

	end

	private
	def ticket_params
		params.require(:ticket_type).permit(:name, :price, :max_quantity)
	end
end
