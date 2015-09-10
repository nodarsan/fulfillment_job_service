require_relative 'fulfillment_job_remote_system'
require 'money'

remote_job_system = FulfillmentJobRemoteSystem.new

begin
  puts remote_job_system.create_job(printer_id: 2, name: "name", cost: Money.new(235, 'GBP'))
rescue => e
  puts "Unhandled exception: #{e.message}"
end
