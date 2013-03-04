class ReservationsController < ActionController::Base
  layout 'application'
  
  def index
    @pagetitle = "Welcome to Save Me a Seat - your travel App!"
    @pagedescription = "Save me a seat: Your one stop shop for travel reservations"
    
    @reservations = Reservation.all
    respond_to do |format|
      format.html # show.html.erb
      # format.json { render json: @reservations }
    end
  end
  
  def show
    @reservation = Reservation.find(params[:id])
  end
  
  def new
    @pagetitle = "Welcome to Save Me a Seat - your travel App!"
    @pagedescription = "Save me a seat: Your one stop shop for travel reservations"
    
    @cities = City.order("name ASC").all
    @reservation = Reservation.new
    @listdata = build_state_city_list(@cities)
  end

  def create
    @reservation = Reservation.new(params[:reservation])

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        # format.json { render json: @reservation, status: :created, location: @reservation }
      else
        format.html { render action: "new" }
        # format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])

    respond_to do |format|
      if @reservation.update_attributes(params[:reservation])
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end
  

  def build_state_city_list( data )
    return "no cities available" if data.empty?
    list = []
    data.each do |x|
      list << x.name + ', ' + State.from_city(x.state_id)[0].name.camelize.gsub('Of', 'of')
    end
    list
  end
  

end