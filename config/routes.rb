Rails.application.routes.draw do
  resources :warehouses
  devise_for :admin_users, path: 'admins'
  devise_for :applicant_users, path: 'applicants'
  
  # devise_for :applicant_users, controllers: {
  #   registrations: 'applicant_users/registrations',
  #   sessions: 'applicant_users/sessions'
  # }

  # devise_for :admin_users, controllers: {
  #   registrations: 'admin_users/registrations',
  #   sessions: 'applicant_users/sessions'
  # }

  root 'welcome#index'
end
