
class ValidationError < StandardError

  attr_accessor :class_name, :details

  def initialize(class_name, details)
    @class_name = class_name
    @details = details
  end
end