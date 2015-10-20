Rails.application.routes.draw do

  devise_for :administrators, skip: [:sessions, :passwords, :confirmations, :registrations]
  as :administrator do
    # get 'administrator/login' => 'devise/sessions#new', as: :administrator_login
    # delete 'administrator/logout' => 'devise/sessions#destroy', as: :administrator_logout

    # session handling
    scope '/gdpp-admin' do

      get     '/login'  => 'devise/sessions#new',     as: 'new_administrator_session'
      post    '/login'  => 'devise/sessions#create',  as: 'administrator_session'
      delete  '/logout' => 'devise/sessions#destroy', as: 'destroy_administrator_session'

      # joining
      get   '/join' => 'devise/registrations#new',    as: 'new_administrator_registration'
      post  '/join' => 'devise/registrations#create', as: 'administrator_registration'

    end
    scope '/account' do
      # password reset
      get   '/reset-password'        => 'devise/passwords#new',    as: 'new_administrator_password'
      put   '/reset-password'        => 'devise/passwords#update', as: 'administrator_password'
      post  '/reset-password'        => 'devise/passwords#create'
      get   '/reset-password/change' => 'devise/passwords#edit',   as: 'edit_administrator_password'
      # confirmation
      get   '/confirm'        => 'devise/confirmations#show',   as: 'administrator_confirmation'
      post  '/confirm'        => 'devise/confirmations#create'
      get   '/confirm/resend' => 'devise/confirmations#new',    as: 'new_administrator_confirmation'
      # settings & cancellation
      get '/cancel'   => 'devise/registrations#cancel', as: 'cancel_administrator_registration'
      get '/settings' => 'devise/registrations#edit',   as: 'edit_administrator_registration'
      put '/settings' => 'devise/registrations#update'
      # account deletion
      delete '' => 'devise/registrations#destroy'
    end
  end

  get 'administrator/index', as: 'administrator_index'
  get 'administrator/home', as: 'administrator_home'

  get 'announcements/show_public_service'
  get 'announcements/show_question_answer'
  get 'announcements/show_contact'

  get 'announcements/show_procurement_entity_city_province'
  get 'announcements/show_procurement_entity_ministry'
  get 'announcements/show_procurement_entity_public_foundation'

  get 'announcements/show_bidder_list_registrative_form'
  get 'announcements/show_bidding_document'
  get 'announcements/show_planning_approval_correction'

  get 'announcements/show_gdpp_role'
  get 'announcements/show_gdpp_structure'

  get 'announcements/show_procurement_goods'

  resources :admin_announcements
  resources :announcements

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'announcements#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

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
