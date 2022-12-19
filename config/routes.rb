Rails.application.routes.draw do
  devise_for :users,  path: 'patients',
                      controllers: {
                        sessions:      'patients/devise/sessions',
                        passwords:     'patients/devise/passwords',
                        registrations: 'patients/devise/registrations'
                      }

  root to: 'patients/glucose_readings#index', as: :patient_root_path

  namespace :patients do
    resource :glucose_readings, only: %w[index new]
  end

  #We will enable it if we need to implement doctors functionality
  # devise_for :doctors,  path: 'doctors',
  #                     controllers: {
  #                       sessions:      'doctors/devise/sessions',
  #                       passwords:     'doctors/devise/passwords',
  #                       registrations: 'doctors/devise/registrations'
  #                     }

  # namespace :doctor do
    
  # end
  # authenticated :doctor do
  #   root 'doctors/home#index',      as: :auth_doctor_root
  # end
end
