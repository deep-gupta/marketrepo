class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    if user.user_type == 'admin' #Admin
      can [:index, :new, :create], [Category, Mall]
      can [:show_product], [Category]
      can [:show_state, :show_city], [Mall]
      can [ :index,:destroy, :display_all_users, :confirm_pending, :pending], [User]
    
    elsif user.user_type == '1' # visitors
      can [:choose_categories, :save_categories], [Category]
      can [:new, :create], [Order]
      can [:index, :edit, :update,:showproduct], [User]
      can [:add_to_cart, :destroy, :index], [Cart]
    else # Shopkeepers
      can [:new, :create], [Offer]
      can [:index, :new,:create], [Product]
      can [:new, :create,:show_mall], [Shop]
      can [:index, :edit, :update], [User]
      can [:show_state, :show_city], [Mall]
    end
  end
end
