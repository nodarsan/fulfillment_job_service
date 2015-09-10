Rails.application.routes.draw do
  post '/fulfillment_job' => 'fulfillment_job#handle'
end
