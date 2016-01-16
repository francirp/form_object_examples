module Forms
  class BaseForm < Goaltender::BaseForm
    include ActiveModel::Model # i.e. validations
  end
end
