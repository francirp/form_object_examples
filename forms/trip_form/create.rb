module Forms
  class TripForm
    class Create
      include Forms::Rest::Create
      # basically Forms::Rest::Create will instantiate a new Trip
      # and pass in the params after they are parsed

      def before_save
        # before create callback goes here
      end

      def after_save
        # after create callback goes here
      end
    end
  end
end
