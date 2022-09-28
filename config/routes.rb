Rails.application.routes.draw do

Spree::Core::Engine.add_routes do
  namespace :admin do
    resource :email_settings
  end
end
end
