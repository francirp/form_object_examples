module Forms
  class CarForm
    class ElectricForm
      model :electric_car

      input :voltage, :float
      input :range, :float

      validates :voltage, presence: true, numericality: true
      validates :range,   presence: true, numericality: true
    end
  end
end
