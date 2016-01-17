module Forms
  class CarForm
    model :car

    # inputs that pertain to every car no matter the type
    input :safety_rating, :float
    input :manufacturer
    input :make
    input :model
    input :year, :integer

    # validations that pertain to every car no matter the type
    validates :safety_rating, presence: true
  end
end
