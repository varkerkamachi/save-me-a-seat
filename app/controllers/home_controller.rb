class HomeController < ApplicationController
  layout 'application'
  
  def index
    @pagetitle = "Welcome to Save Me a Seat - your travel App!"
    @pagedescription = "Save me a seat: Your one stop shop for travel reservations"
    @reservations = Reservation.all 
  end  

end