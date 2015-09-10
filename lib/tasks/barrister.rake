namespace :barrister do
  task :generate => :environment do
    service_path = Rails.root.join("app/services/fulfillment_jobs")
    `barrister -t 'FulfillmentJobsSystem' -d #{service_path.join("interface.html")} -j #{service_path.join("interface.json")} #{service_path.join("interface.idl")}`
  end
end
