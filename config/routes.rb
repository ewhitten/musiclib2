Musiclib2::Application.routes.draw do
  resources :tracks

  resources :categories

  resources :volumes

  resources :artists

  get "welcome/index"
  

  root 'welcome#index'

end
