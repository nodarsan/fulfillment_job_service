class JobRepository
  def create(printer_id, name, cost)
    {
        id: 1,
        printer_id: printer_id,
        name: name,
        status: 'active',
        cost: cost,
    }
  end
end
