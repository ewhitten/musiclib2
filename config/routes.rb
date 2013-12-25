Musiclib2::Application.routes.draw do
  resources :tracks

  resources :categories

  resources :volumes do
    resources :tracks
  end

  resources :artists do
    resources :volumes
  end

  get "welcome/index"
  
  match 'search' => 'welcome#search', via: [:get, :post], as: :search
   
  root 'welcome#index'

end
