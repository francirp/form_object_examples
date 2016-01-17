module Forms
  class CarForm
    class SelfDrivingForm
      model :self_driving_car

      input :software

      validates :software,      presence: true
    end
  end
end
