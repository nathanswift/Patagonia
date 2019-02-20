Rails.application.routes.draw do
    root "sub#index"
  
    resources :departments do
      resources :categories  
    end
  
    resources :categoriess do
      resources :items
    end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
  