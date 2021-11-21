Rails.application.routes.draw do
  root 'home#index'
   get 'home/precios'
  post '/home/precios' => 'home/precios'
  
end
