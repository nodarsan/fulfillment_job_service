class FulfillmentJobController < ApplicationController

  def handle
    contract = Barrister::contract_from_file(Rails.root.join("app/services/fulfillment_jobs/interface.json"))
    server   = Barrister::Server.new(contract)
    server.add_handler("FulfillmentJobsSystem", FulfillmentJobs::Service.new)
    puts(request.body.read)

    resp = server.handle_json(request.body.read)
    render :json => resp, status: 200
  end
end
