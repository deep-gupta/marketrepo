Market::Application.routes.draw do
  
  get "products/index"

  devise_for :users

  resources :users do
    collection do
      get 'displayallusers'
      get 'confirm_pending'
      get 'showproduct'
      get 'show_cart'
      get 'show_all_category'
    end          
    member do
      get 'pending'
    end
  end
  resources :welcomes
  root :to => 'welcome#index'
  
  resources :categories do
    collection do
      get 'choosecategories'
      get 'savecategories'
    end
    member do
      get 'show_product'
    end
  end

  resources :malls do
    collection do
      get 'showstate'
      get 'showcity'
    end
  end
        
  resources :shops do
    resources :products, :offers
      collection do
        get 'search_result'
        get 'showmall'
      end
  end

  resources :carts do
    member do
      get 'addtocart'
      get 'remove_from_cart'
    end
  end

  resources :orders do
    collection do
      get 'show_cart_product'
      get 'place_order'
    end
  end
        
  resources :payments
end
