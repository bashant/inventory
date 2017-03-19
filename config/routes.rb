Rails.application.routes.draw do
  root 'home#index'
  get 'purchases/index'

  get 'purchases/home'

  devise_for :users
  get 'units/index'

  get 'units/home'

  resources :fiscal_years

  get 'fiscal_years/home'


  resources :company_profiles do
    collection do
      get :manage_company_profiles
    end
  end
  resources :logs
  resources :purchases
  resources :customers
  resources :suppliers
  resources :units
  resources :item_groups
  resources :stocks
  resources :items
  resources :items do
    collection do
      get :manage_items
    end
  end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
