class OfferMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def offer_create(offer)
    @offer = offer

    mail(to: @offer.shop.user.email, subject: 'Welcome to My Awesome Site')
  end
  
  def mail_to_users(usercategories, offer)
    @user_categories = usercategories
    @offer = offer
      mail(to: @user_categories.user.email, subject: 'This offer is for you')  
    
  end
  
end
