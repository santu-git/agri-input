Rails.application.routes.draw do

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :educations
    end
  end

  namespace :admin do
    get '', to: 'dashboard#index', as: 'root'
    resources :educations
    resources :applicants, only: [:index, :show]
    resources :applications, only: [:index, :show]
    resources :users
    resources :certificate_rules
  end

  namespace :applicant do
    resources :warehouses
    resources :qualifications
    resources :applications
    resources :form_a1s
  end

  root 'applicant/dashboard#index'

  resources :certificate_rules
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
    sessions: 'applicant_users/sessions',
    passwords: 'applicant_users/passwords'
  }

  devise_for :admin_users, path: 'admins', controllers: {
    registrations: 'admin_users/registrations',
    sessions: 'admin_users/sessions',
    passwords: 'admin_users/passwords'
  }

end
