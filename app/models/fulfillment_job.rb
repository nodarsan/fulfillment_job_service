
class FullfillmentJob < ActiveRecord::Base

  validates_format_of :name, :with => /[a-zA-Z]/
  monetize :cost_in_cents, :as => 'cost'

  def self.new!(*args, &block)
    self.new(*args, &block).tap do |instance|
      raise ValidationError.new(instance, instance.errors) if instance.invalid?
    end

  end
end