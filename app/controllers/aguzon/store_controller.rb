class Aguzon::StoreController < Aguzon::BaseController
  include Spree::Core::ControllerHelpers::Pricing
  include Spree::Core::ControllerHelpers::Order

  def unauthorized
    render 'aguzon/orders/edit', status: 401
  end

  def cart_link
    render partial: 'spree/shared/link_to_cart'
    fresh_when(current_order, template: 'spree/shared/_link_to_cart')
  end

  private

  def config_locale
    Spree::Frontend::Config[:locale]
  end

  def lock_order
    Spree::OrderMutex.with_lock!(@order) { yield }
    rescue Spree::OrderMutex::LockFailed
      flash[:error] = t('spree.order_mutex_error')
      redirect_to spree.cart_path
  end
end
