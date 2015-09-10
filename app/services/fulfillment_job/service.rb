require 'money'

module FulfillmentJob
  class Service
    def create(printer_id, name, cost)
      job = JobRepository.new.create(printer_id, name, deserialize_money(cost))
      serialize(job)
    end

    private

    def deserialize_money(money)
      Money.new(money['cents'], money['currency'] || 'USD')
    end

    def serialize_money(money)
      { 'cents' => money.cents, 'currency' => money.currency.to_s }
    end

    def serialize_error(error)
      { klass_name: error.class_name, details: details }.stringify_keys
    end

    def serialize(job)
      job.stringify_keys.merge('cost' => serialize_money(job[:cost]))
    end
  end
end
