module Forms
  module Rest
    class Create
      def initialize(args = {})
        super(args)
        obj = model_name.constantize.new(to_h)
        instance_variable_set("@#{model_name}", obj)
        # i.e. @trip = Trip.new(to_h)
      end
    end
  end
end
