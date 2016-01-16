module Goaltender
  class BaseForm
    include ActiveModel::Model

    attr_reader :params, :inputs
    attr_accessor :inputs

    def initialize(args)
      @params = HashWithIndifferentAccess.new(args)
      @inputs = set_inputs
      after_init(@params)
    end

    def to_h
      hash = {}
      inputs.each do |input|
        value = instance_variable_get("@#{input.variable_name}")

        # only set values to nil when they are intended to be nil
        next if value.nil? && (input.association? || params.keys.exclude?(input.name.to_s))

        hash[input.variable_name] = value
      end
      hash
    end

    def save
      before_save
      success = valid_form? ? persist! : false
      if success
        after_save
        true
      else
        false
      end
    end

    def self.input(name, type = nil, options = {})
      @@input_definitions ||= {}
      array = @@input_definitions[self.name].present? ? @@input_definitions[self.name] : []
      array << [name, type, options]
      @@input_definitions[self.name] = array
    end

    def self.input_definitions
      @@input_definitions
    end

    private

      def set_inputs
        setter = DirectoryParser.new(current_class_name: self.class.name)
        all_inputs = []
        Goaltender::BaseForm.input_definitions.each do |class_name, form_inputs|
          next unless setter.relevant_classes.include?(class_name)
          form_inputs.each do |form_input|
            all_inputs << set_input(form_input)
          end
        end
        all_inputs
      end

      def set_input(form_input)
        name = form_input[0]
        type = form_input[1]
        options = form_input[2]
        input_value = params[name]
        input = Goaltender::Input.new(self, name, type, input_value, options)
        self.class.__send__(:attr_accessor, input.variable_name)
        instance_variable_set("@#{input.variable_name.to_s}", input.parsed_value)
        return input
      end

      def valid_form?
        valid? && object.valid?
      end

      def persist!
        object.save
      end

      # METHODS FOR CHILDREN

      def after_init(args)
        # this method is optionally implemented by children to
        # override default initialization behavior
      end

      def object
        fail "The object method should be implemented by #{self.class.name} when it pertains to an ActiveRecord model"
      end

      def after_save
        # optionally implemented by children
      end

      def before_save
        # optionally implemented by children
      end
  end
end
