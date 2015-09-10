require 'barrister'

trans = Barrister::HttpTransport.new("http://localhost:3000/fulfillment_job")
client = Barrister::Client.new(trans)

puts client.FulfillmentJobSystem.create(2, "name", 2.14)
