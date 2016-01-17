module Forms
  class TripForm
    model :trip

    # these inputs pertain to every trip form
    input :avg_speed, :float
    input :name
    input :car, :has_one, form: "Forms::CarForm::#{car_type}Form" # i.e. Forms::CarForm::ElectricForm

    validates :avg_speed, presence: true, numericality: true
    validates :name,      presence: true

    def car_type
      params[:car][:type]
    end
  end
end
