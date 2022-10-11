Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "albums#index"
  get "/" => "albums#index", as: "albums"
  get "/new" => "albums#new", as: "new_album"
  post "/new" => "albums#create", as: "create_album"
  delete "/:id" => "albums#delete", as: "delete_album"
  get "/:id" => "albums#show", as: "show_album"
  get "/edit/:id" => "albums#edit", as: "edit_album"
  post "/update" => "albums#update", as:"update_album"
  # Defines the root path route ("/")
  # root "articles#index"
end
