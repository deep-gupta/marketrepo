class PaymentsController < ApplicationController

  def new
     @payment = Payment.new
    @creditcard = ActiveMerchant::Billing::CreditCard.new
  end
  def create
   @payment = Payment.new(params[:payment])
    @creditcard = ActiveMerchant::Billing::CreditCard.new(params[:creditcard])
    @payment.valid_card = @creditcard.valid?
    if @payment.valid? 
      @payment = @payment.process_payment(@creditcard)
      if @payment.success?
        @payment.save
        flash[:notice] = I18n.t('payment.success')
        redirect_to payments_url and return
      else
        flash[:error] = I18n.t('payment.failed')
      end
    end
    render :action => :new

  end
end
