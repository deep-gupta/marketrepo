Market::Application.routes.draw do
  
  get "products/index"

  devise_for :users

  resources :users do
    collection do
      get 'display_all_users'
      get 'confirm_pending'
      get 'show_products'
      get 'show_cart'
    end          
    member do
      get 'pending'
    end
  end
  resources :welcomes
  root :to => 'welcome#index'
  
  resources :categories do
    collection do
      get 'choose_categories'
      get 'save_categories'
    end
    member do
      get 'show_product'
    end
  end

  resources :malls do
    collection do
      get 'show_state'
      get 'show_city'
    end
  end
        
  resources :shops do
    resources :products, :offers
      collection do
        get 'search_result'
        get 'show_mall'
      end
  end

  resources :carts do
    member do
      get 'add_to_cart'
    end
  end

  resources :orders do
    collection do
      get 'place_order'
    end
  end
        
  resources :payments
end
