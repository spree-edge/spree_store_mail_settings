Rails.application.routes.draw do
  Spree::Core::Engine.add_routes do
    namespace :admin do
      resource :email_settings, only: [:edit, :update] do
        post :send_test_mail, on: :collection
      end
    end
  end
end
