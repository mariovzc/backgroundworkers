Rails.application.routes.draw do
  root 'file_analyses#new'
  resources :file_analyses

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
