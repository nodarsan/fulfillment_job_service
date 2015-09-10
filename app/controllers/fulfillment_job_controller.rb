class FulfillmentJobController < ApplicationController

  def handle
    contract = Barrister::contract_from_file("../services/fulfilment_job_service/interface.json")
    server   = Barrister::Server.new(contract)
    server.add_handler("FulfillmentJobService", FulfillmentJobService.new)

    resp = server.handle_json(request.body.read)
    render :json => resp
  end
end
