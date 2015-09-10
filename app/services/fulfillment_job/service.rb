module FulfillmentJob
  class Service
    def create(printer_id, name, cost)
      job = JobRepository.new.create(printer_id, name, cost)

      serialize(job)
    end

    private

    def serialize(job)
      job.stringify_keys
    end
  end
end
