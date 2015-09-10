require 'money'

class FulfillmentJob < ActiveRecord::Base

  validates :name, length: { minimum: 5 }

  monetize :cost_in_cents, :as => 'cost'

  def self.new!(*args, &block)
    self.new(*args, &block).tap do |instance|
      raise ValidationError.new(self.name, instance.errors.to_hash) if instance.invalid?
    end
  end
end
