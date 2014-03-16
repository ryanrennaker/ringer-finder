Home::Application.routes.draw do

  get "/admin" => 'admin#sports'
  get "/admin/addsport" => 'admin#addsport'
  get "/admin/deletesport" => 'admin#deletesport'

  get "/login" => 'sessions#new'
  get "/logout" => 'sessions#destroy'
  get "/authenticate" => 'sessions#create'

  root 'home#index'

  get "/users/new" => 'users#new'
  get "/users/create" => 'users#create'

  # Profile view (editable mode for logged in users)
  get "/users/:user_id/show" => 'users#show'

  # Ringer-related URLs

  # CREATE
  get "/profile/create" => "ringers#create"

  # READ
  get "/ringers" => 'ringers#list'
  get "/ringers/:ringer_id/show" => "ringers#show"

  # UPDATE
  get "/profile/update" => "ringers#update"

  # DELETE
  get "profile/delete" => "ringers#delete"
  get "profile/deleteall" => "users#delete"
  # Some of this is done via update (e.g. if you change the checkboxes on which sports you play)

end
