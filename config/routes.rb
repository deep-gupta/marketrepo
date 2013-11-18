Market::Application.routes.draw do
  
  get "products/index"

  devise_for :users

      resources :users do
          collection do
          get 'displayallusers'
          get 'confirm_pending'
          get 'showproduct'

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
        end

        resources :malls do
          collection do
          get 'showstate'
          get 'showcity'
          end

        end
        
        resources :shops do
          resources :products
          collection do
            get 'showmall'
          end
        end

        resources :carts do
        member do
          get 'addtocart'
        end
        end

        resources :orders do
          collection do
            get 'show_cart_product'
            get 'place_order'
          end
        end
end