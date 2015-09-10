namespace :barrister do
  task :generate => :environment do
    service_path = Rails.root.join("app/services/fulfillment_job_service")
    `barrister -t 'FulfillmentJobService' -d #{service_path.join("interface.html")} -j #{service_path.join("interface.json")} #{service_path.join("interface.idl")}`
  end
end
