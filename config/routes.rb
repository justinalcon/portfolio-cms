Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }
  resources :announcements 
  resources :sparks
	resources :tags

  root to: 'rails_admin/main#dashboard' 

  # api sessions
  post 'api/login', to: 'api#get_session'

  mount Ckeditor::Engine => '/ckeditor'
  

end
