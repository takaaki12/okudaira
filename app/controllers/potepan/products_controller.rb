class Potepan::ProductsController < ApplicationController
  DISPLAY_RELATED_PRODUCTS_NUMBER = 4

  def show
    @product = Spree::Product.find(params[:id])
    @images  = @product.images
    @related_products = Spree::Product.includes(master: [:images, :default_price]).
      related_products(@product).shuffle.take(DISPLAY_RELATED_PRODUCTS_NUMBER)
  end
end
