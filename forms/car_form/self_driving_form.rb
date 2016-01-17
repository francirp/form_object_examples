module Forms
  class CarForm
    class GasForm
      input :software

      validates :software,      presence: true
    end
  end
end
