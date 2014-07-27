Sufi::Application.routes.draw do
  resources :coffee_orders

  resources :coffee_items
  scope "api" do
    resources :coffees, controller: :coffee_types
  end
  match "api/coffees.json", to: "coffee_types#create", via: [:post,:options]
  get "api/ping" => "application#ping"

  root :to => "home#index"

  match "/i18n", to: "home#fun_with_translations", via: :get
  match "/i18n_esp", to: "home#esp_fun_with_translations", via: :get
  devise_for :users
end
