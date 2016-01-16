module Forms
  module Rest
    class Update
      def initialize(args = {})
        super(args)
        obj = model_name.constantize.find(args[:id])
        instance_variable_set("@#{model_name}", obj)
        # i.e. @trip = Trip.find(args[:id])
      end
    end
  end
end
