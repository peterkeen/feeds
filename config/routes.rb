Rails.application.routes.draw do

  if Rails.env.development?
    mount MailPreview => 'mail_view'
  end

  resources :feeds do
    collection do
      get 'add'
    end

    member do
      get 'remove'
    end
  end

  root to: 'feeds#index'
end
