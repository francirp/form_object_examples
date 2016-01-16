class TripsController
  def create
    @trip_form = Forms::TripForm::Create.new(params[:trip])

    if @trip_form.save
      # success
    else
      # failure
    end
  end

  def update
    trip_params = params[:trip].merge(id: params[:id])
    @trip_form = Forms::TripForm::Update.new(trip_params)

    if @trip_form.save
      # success
    else
      # failure
    end
  end
end
