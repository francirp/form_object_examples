module Forms
  class TripForm
    model :trip

    # these inputs pertain to every trip form
    input :avg_speed, :float
    input :name
    input :behaviors, :array
    input :software
    input :safety_rating, :float
    input :voltage, :float
    input :range, :float
    input :fuel_type
    input :mpg, :float
    input :transission_type

    # these validations pertain to every trip form
    validates :avg_speed, presence: true, numericality: true
    validates :name,      presence: true
    validates :behaviors, presence: true

    # dreaming a bit here, but would be nice to do something like:
    validates_conditionally :car_type, 'Electric' do
      validates :voltage, presence: true, numericality: true
      validates :range,   presence: true, numericality: true
    end

    validates_conditionally :car_type, 'Gas' do
      validates :fuel_type,        presence: true
      validates :mpg,              presence: true, numericality: true
      validates :transission_type, presence: true
    end

    validates_conditionally :car_type, 'SelfDriving' do
      validates :software,      presence: true
      validates :safety_rating, presence: true
    end
  end
end
