module Forms
  class TripForm
    class Create
      include Forms::Rest::Update
      # basically Forms::Rest::Update will find the Trip
      # and pass in the params after they are parsed

      def before_save
        # before update callback goes here
      end

      def after_save
        # after update callback goes here
      end
    end
  end
end
