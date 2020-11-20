Rails.application.routes.draw do
  # This line mounts Solidus's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted,
  # simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here,
  # as Solidus relies on it being the default of "spree"
  mount Spree::Core::Engine, at: '/'

  namespace :aguzon do
    get '/',                        to: 'home#index'
    get 'index',                    to: 'home#index'
    get 'about_us',                 to: 'home#about_us'
    get 'product_grid_left_sidebar', to: 'home#product_grid_left_sidebar'
    get :product_list_left_sidebar, to: 'sample#product_list_left_sidebar'
    get :single_product,            to: 'sample#single_product'
    get :cart_page,                 to: 'home#cart_page'
    get :checkout_step_1,           to: 'sample#checkout_step_1'
    get :checkout_step_2,           to: 'sample#checkout_step_2'
    get :checkout_step_3,           to: 'sample#checkout_step_3'
    get :checkout_complete,         to: 'sample#checkout_complete'
    get :blog_left_sidebar,         to: 'sample#blog_left_sidebar'
    get :blog_right_sidebar,        to: 'sample#blog_right_sidebar'
    get :blog_single_left_sidebar,  to: 'sample#blog_single_left_sidebar'
    get :blog_single_right_sidebar, to: 'sample#blog_single_right_sidebar'
    get :tokushoho,                 to: 'sample#tokushoho'
    get :privacy_policy,            to: 'sample#privacy_policy'
    resources :products, only: :show
    resources :categories, only: :show
    resources :home, only: :index
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
