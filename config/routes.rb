Home::Application.routes.draw do

  get "/login" => 'sessions#new'
  get "/logout" => 'sessions#destroy'
  get "/authenticate" => 'sessions#create'

  root 'home#index'

  get "/users/new" => 'users#new'
  get "/users/create" => 'users#create'

  #Profile view
  get "/users/:user_id/show" => 'users#show'

  # Ringer-related URLs

  # CREATE
  get "/show/create" => "ringers#create"

  # READ
  get "/ringers" => 'ringers#list'
  get "/ringers/:ringer_id/show" => "ringers#show"

  # UPDATE
  get "/show/update" => "ringers#update"

  # DELETE
  # Some of this is done via update (e.g. if you change the checkboxes on which sports you play)

end
