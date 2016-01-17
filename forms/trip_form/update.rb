module Forms
  class TripForm
    class Create
      include Forms::Rest::Update
      # basically Forms::Rest::Update will find the Trip
      # and pass in the params after they are parsed

      def before_save
        # runs before update
      end

      def after_save
        # runs after update
      end
    end
  end
end
