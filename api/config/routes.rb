Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get 'api/notes', action: :index, controller: 'note', as: 'read_notes'
  post 'api/notes', action: :create, controller: 'note', as: 'create_note'
  get 'api/notes/:id', action: :show, controller: 'note', as: 'read_note'
  put 'api/notes/:id', action: :update, controller: 'note', as: 'update_note'
  delete 'api/notes/:id', action: :destroy, controller: 'note', as: 'delete_note'

  post 'api/users/signup', action: :signup, controller: 'user', as: 'signup'
  post 'api/users/login', action: :login, controller: 'user', as: 'login'
  post 'api/users/logout', action: :logout, controller: 'user', as: 'logout'
end
