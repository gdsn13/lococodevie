# Locomotive::Application.routes.draw do |map|

Rails.application.routes.draw do
  # admin authentication
  devise_for :admin, :class_name => 'Account', :controllers => { :sessions => 'admin/sessions', :passwords => 'admin/passwords' }

  as :admin do
    get '/admin' => 'admin/sessions#new'
  end

  # admin interface for each website
  namespace 'admin' do
    root :to => 'sessions#new'

    resources :pages do
      put :sort, :on => :member
      get :get_path, :on => :collection
    end

    resources :snippets

    resources :sites

    resource :current_site, :controller => 'current_site'

    resources :accounts

    resource :my_account, :controller => 'my_account'

    resources :memberships
    
    resources :embeded_items

    resources :theme_assets do
      get :all, :action => 'index', :on => :collection, :defaults => { :all => true }
    end

    resources :assets
        
    resources :object_contents
    
    resources :jules
    
    resources :actus
    
    resources :boutons

    resources :content_types

    resources :contents, :path => 'content_types/:slug/contents' do
      put :sort, :on => :collection
    end

    resources :api_contents, :path => 'api/:slug/contents', :controller => 'api_contents', :only => [:create]

    resources :custom_fields, :path => 'custom/:parent/:slug/fields'

    resources :cross_domain_sessions, :only => [:new, :create]

    resource :import, :only => [:new, :show, :create], :controller => 'import'

    resource :export, :only => [:new], :controller => 'export'
    
    
    match '/export/recreate_thumbz' => 'export#recreate_thumbz', :controller => 'export'
    # installation guide
    match '/installation' => 'installation#show', :defaults => { :step => 1 }, :as => :installation
    match '/installation/:step' => 'installation#show', :as => :installation_step

  end
  match '/front_login' => "front/datas#get_login"
  # sitemap
  match '/sitemap.xml' => 'admin/sitemaps#show', :format => 'xml'
  match '/user_sessions/create' => 'user_sessions#create'
  match '/user_sessions/delete' => 'user_sessions#destroy'

  # robots.txt
  match '/robots.txt' => 'admin/robots#show', :format => 'txt'

  # magic urls
  match '/' => 'admin/rendering#show'
  match '/search' => 'admin/rendering#search'
  match '*path/edit' => 'admin/rendering#edit'
  match '*path' => 'admin/rendering#show'

end