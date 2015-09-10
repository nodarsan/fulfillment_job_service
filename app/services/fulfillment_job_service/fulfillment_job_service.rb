class FulfillmentJobSerivce
  def create(printer_id, name, cost)
    job = FulfillmentJob.create!(
                      printer_id: printer_id,
                      name: name,
                      status: 'active',
                      cost: cost,
    )
    serialize(job)
  end

  private

  def serialize(job)
    job.serializable_hash
  end
end
