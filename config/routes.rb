Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    post "invoices" => "invoices#create"
    get "invoices" => "invoices#list"
    get "invoices/:id" => "invoices#show"
    post "invoices/:id/line_item" => "invoices#add_line_item"
    post "invoices/:id/finalise" => "invoices#finalise"
  end

  root to: "invoices#index"
  get "invoices/:id" => "invoices#show"
  get "invoices/" => "invoices#create"
end
