require 'money'
module FulfillmentJob
  class Service
    def create(printer_id, name, cost)
      puts Money.from_amount(cost['value'])
      job = {
          id: 1,
          printer_id: printer_id,
          name: name,
          status: 'active',
          cost: Money.from_amount(cost['value'], cost['currency'] || 'USD'),
      }
      serialize(job)
    end

    def show_exception
      raise "Esto es una exception!!"
    end

    private

    def serialize(job)
      job.merge({cost: {"value": 12}.stringify_keys}).stringify_keys
    end
  end
end
