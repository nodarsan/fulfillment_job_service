require 'money'
module FulfillmentJob
  class Service
    def create(printer_id, name, cost)
      job = JobRepository.new.create(printer_id, name, Money.from_amount(cost['value'], cost['currency'] || 'USD'))
      serialize(job)
    end

    def show_exception
      raise "Esto es una exception!!"
    end

    private

    def serialize_error(error)
      { klass_name: error.class_name, details: details }.stringify_keys
    end

    def serialize(job)
      job.merge({cost: {"value": 12}.stringify_keys}).stringify_keys
    end
  end
end
