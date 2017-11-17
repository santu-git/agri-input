Rails.application.routes.draw do
  
  namespace :applicant do
    resources :warehouses
    resources :qualifications
  end

  devise_for :admin_users, path: 'admins'
  devise_for :applicant_users, path: 'applicants', controllers: {
    registrations: 'applicant_users/registrations',
    sessions: 'applicant_users/sessions'
  }
  
  # devise_for :applicant_users, controllers: {
  #   registrations: 'applicant_users/registrations',
  #   sessions: 'applicant_users/sessions'
  # }

  # devise_for :admin_users, controllers: {
  #   registrations: 'admin_users/registrations',
  #   sessions: 'applicant_users/sessions'
  # }

  resources :states do
    resources :districts, except: [:index]
    resources :districts, only: [:index], defaults: { format: 'json' }
  end
  root 'welcome#index'
end
