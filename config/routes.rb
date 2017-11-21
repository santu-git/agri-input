Rails.application.routes.draw do

  resources :certificate_rules
  namespace :admin do
    get '', to: 'dashboard#index', as: 'root'
    resources :educations
    resources :applicants, only: [:index, :show]
    resources :users
    resources :certificate_rules
  end

  namespace :applicant do
    resources :warehouses
    resources :qualifications
  end
  
  root 'applicant/dashboard#index'
  
  resources :states do
    resources :districts, only: [:index], defaults: { format: 'json' }
  end
  resources :districts do
    resources :subdivisions, only: [:index], defaults: { format: 'json' }
  end

  resources :subdivisions do
    resources :blocks, only: [:index], defaults: { format: 'json' }
  end

  resources :blocks do
    resources :mouzas, only: [:index], defaults: { format: 'json' }
  end
  

  devise_for :applicant_users, path: 'applicants', controllers: {
    registrations: 'applicant_users/registrations',
    sessions: 'applicant_users/sessions'
  }

  devise_for :admin_users, path: 'admins', controllers: {
    registrations: 'admin_users/registrations',
    sessions: 'admin_users/sessions'
  }

  # devise_for :applicant_users, controllers: {
  #   registrations: 'applicant_users/registrations',
  #   sessions: 'applicant_users/sessions'
  # }

  # devise_for :admin_users, controllers: {
  #   registrations: 'admin_users/registrations',
  #   sessions: 'applicant_users/sessions'
  # }
end
