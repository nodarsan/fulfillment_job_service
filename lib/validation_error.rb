
class ValidationError < StandardError
  attr_accessor :model_class_name, :details

  def initialize(model_class_name, details)
    @model_class_name = model_class_name
    @details = details
  end
end
