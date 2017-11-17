Rails.application.routes.draw do

  namespace :admin do
    get '', to: 'welcome#index', as: 'root'
  end

  resources :warehouses
  resources :qualifications

  resources :states do
    resources :districts, except: [:index]
    resources :districts, only: [:index], defaults: { format: 'json' }
  end

  root 'warehouses#index'

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
