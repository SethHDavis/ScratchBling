Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :scratchers
    root 'scratchers#index'
  end
end
