Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

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
