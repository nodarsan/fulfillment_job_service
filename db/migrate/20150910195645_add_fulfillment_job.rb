class AddFulfillmentJob < ActiveRecord::Migration
  def change
    create_table :fulfillment_jobs do |c|
      c.string :name
      c.string :status
      c.integer :printer_id
      c.integer :cost_in_cents
    end
  end
end
