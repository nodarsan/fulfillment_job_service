require 'barrister'

trans = Barrister::HttpTransport.new("http://localhost:3000/fulfillment_job")
client = Barrister::Client.new(trans)

puts client.FulfillmentJobService.create(name: "nombre", printer_id: 2, cost: 2.14)
