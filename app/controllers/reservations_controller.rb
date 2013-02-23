class ReservationsController < ActionController::Base
  layout 'application'
  
  def index
    @reservations = Reservation.all
    respond_to do |format|
      format.html # show.html.erb
      # format.json { render json: @reservations }
    end
  end
  
  def show
    @reservation = Reservation.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      # format.json { render json: @reservations }
    end
  end
  

end