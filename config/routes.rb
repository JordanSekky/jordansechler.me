Myapp::Application.routes.draw do
  get "welcome/index"
  get "home/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
root to: 'articles#index'

    resources :articles
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
    devise_for :users, :skip => 'registration', controllers: { sessions: "users/sessions" }
    devise_scope :user do
        post "/users", :to => "users/registrations#create", :as => "user_registration"
        get "/users/cancel", :to => "users/registrations#cancel", :as => "cancel_user_registration"
        get "/users/edit", :to => "users/registrations#edit", :as => "edit_user_registration"
        patch "/users", :to => "users/registrations#update", :as => nil
        put "/users", :to => "users/registrations#update", :as => nil
        delete "/users", :to => "users/registrations#destroy", :as => nil
    end
  # user_registration POST   /users(.:format)               devise/registrations#create
  # cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
  # edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
  #                        PATCH  /users(.:format)               devise/registrations#update
  #                        PUT    /users(.:format)               devise/registrations#update
  #                        DELETE /users(.:format)               devise/registrations#destroy
# Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
