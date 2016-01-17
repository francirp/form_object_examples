module Forms
  class TripForm
    class Create
      include Forms::Rest::Create
      # basically Forms::Rest::Create will instantiate a new Trip
      # and pass in the params after they are parsed

      def before_save
        # runs before create
      end

      def after_save
        # runs after create
      end
    end
  end
end
