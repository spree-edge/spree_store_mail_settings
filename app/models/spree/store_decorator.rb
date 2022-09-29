module Spree
  module StoreDecorator
    def self.prepended(base)
      base.has_one :email_setting, class_name: 'Spree::EmailSetting', dependent: :destroy
    end
  end
end

::Spree::Store.prepend Spree::StoreDecorator
