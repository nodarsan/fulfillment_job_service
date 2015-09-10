require 'barrister'
require_relative '../lib/validation_error'


class FulfillmentJobRemoteSystem
  def initialize
    trans = Barrister::HttpTransport.new("http://localhost:3000/fulfillment_job")
    @client = Barrister::Client.new(trans)
  end

  def create_job(printer_id:, name:, cost:)
    @client.FulfillmentJobSystem.create(printer_id, name, {"value" => cost.cents, "currency" => cost.currency.to_s})
  rescue => e
    if e.code == 32100
      deserialize_error(e.data)
    else
      raise e
    end
  end

  private

  def deserialize_error(error)
    ValidationError.new(error.fetch(:class_name), error.fetch(:details))
  end
end
