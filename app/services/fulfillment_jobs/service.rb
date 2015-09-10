require 'money'
require 'validation_error'

module FulfillmentJobs
  class Service
    def create(printer_id, name, cost)
      job = JobRepository.new.create(printer_id, name, deserialize_money(cost))
      serialize(job)
    rescue ValidationError => e
      raise Barrister::RpcException.new(32100, "Business Error", serialize_validation_error(e))
    end

    private

    def deserialize_money(money)
      Money.new(money['cents'], money['currency'] || 'USD')
    end

    def serialize_money(money)
      { 'cents' => money.cents, 'currency' => money.currency.to_s }
    end

    def serialize_validation_error(error)
      { model_class_name: error.model_class_name, details: error.details }
    end

    def serialize(job)
      job.serializable_hash.except("cost_in_cents").merge('cost' => serialize_money(job.cost))
    end
  end
end
