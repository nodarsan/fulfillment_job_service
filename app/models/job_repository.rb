require 'money'

class JobRepository
  def create(printer_id, name, cost)
    job = FulfillmentJob.new!(
        printer_id: printer_id,
        name: name,
        cost: cost,
        status: 'active'
    )

    job.save

    job
  end
end
