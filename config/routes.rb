Rails.application.routes.draw do

  root 'home#index'
  match ':controller(/:action(/:id))', via: :get
  match '*path' => redirect('/')   unless Rails.env.development?
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
