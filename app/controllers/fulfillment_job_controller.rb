class FulfillmentJobController < ApplicationController

  def handle
    contract = Barrister::contract_from_file(Rails.root.join("app/services/fulfillment_job/interface.json"))
    server   = Barrister::Server.new(contract)
    server.add_handler("FulfillmentJobSystem", FulfillmentJob::Service.new)
    puts(request.body.read)


    resp = server.handle_json(request.body.read)
    render :json => resp, status: 200
  end
end
