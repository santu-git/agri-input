Rails.application.routes.draw do

  namespace :admin do
    get '', to: 'welcome#index', as: 'root'
  end

  namespace :applicant do
    resources :warehouses
    resources :qualifications
  end
  
  root 'applicant/dashboard#index'
  
  resources :states do
    resources :districts, except: [:index]
    resources :districts, only: [:index], defaults: { format: 'json' }
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
