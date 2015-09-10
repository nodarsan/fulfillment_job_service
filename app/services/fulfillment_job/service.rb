module FulfillmentJob
  class Service
    def create(printer_id, name, cost)
      job = {
          id: 1,
          printer_id: printer_id,
          name: name,
          status: 'active',
          cost: cost,
      }
      serialize(job)
    end

    private

    def serialize(job)
      job.stringify_keys
    end
  end
end
