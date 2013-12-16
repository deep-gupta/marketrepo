class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    if user.user_type == 'admin'  # Admin
      can [:index, :new, :create, :edit, :update, :destroy], [Category]
      can [:show_product], [Category]
      can [:index, :new, :create, :show_state, :show_city, :edit, :update, :destroy], [Mall]
      can [ :index,:destroy, :display_all_users, :confirm_pending, :pending], [User]
    
    elsif user.user_type == '1'   # Visitors
      can [:choose_categories, :save_categories], [Category]
      can [:new, :create], [Order]
      can [:index, :edit, :update,:show_products], [User]
      can [:add_to_cart, :destroy, :index], [Cart]
      can [:new, :create], [Payment]
    else  # Shopkeepers
      can [:new, :create,:index, :edit,:update,:destroy], [Offer]
      can [:index, :new,:create], [Product]
      can [:new, :create,:show_mall,:index, :edit, :update, :destroy], [Shop]
      can [:index, :edit, :update], [User]
      can [:show_state, :show_city], [Mall]
    end
  
  end
end
