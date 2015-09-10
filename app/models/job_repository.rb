require 'money'

class JobRepository
  def create(printer_id, name, cost)
    cost_in_money = Money.from_amount(cost['value'], cost['currency'] || 'USD')
    FulfillmentJob.new!(
        printer_id: printer_id, name: name,
        cost: cost_in_money, status: 'active'
    )
  end
end
