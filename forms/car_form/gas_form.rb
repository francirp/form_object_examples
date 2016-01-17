module Forms
  class CarForm
    class GasForm
      model :gas_car

      input :fuel_type
      input :mpg, :float
      input :transission_type

      validates :fuel_type,        presence: true
      validates :mpg,              presence: true, numericality: true
      validates :transission_type, presence: true
    end
  end
end
