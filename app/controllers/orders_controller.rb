class OrdersController < ApplicationController
  def create
    if TicketType.orderAvailable(params[:quantity]) 
      @order = Order.new order_params
      params[:quantity].each do |key, value|
        if value.to_i > 0
          @order.order_details.build ticket_id: key, quantity: value
        end
      end

      if @order.save
        flash[:success] = "Successfully booked"
        redirect_to root_path
      else
        flash[:error] = "Failed to booked"
        redirect_to event_tickets_path(Event.find params[:event_id])
      end
    else
      flash[:error] = "Your ticket request is not available"
      redirect_to event_tickets_path(Event.find params[:event_id])
    end
  end

  def order_params
    params.permit(:name, :email, :address, :phone)
  end
end
