module SpreeStoreMailSetting
  module Spree
    module BaseMailerDecorator

      def self.prepended(base)
        base.before_action :ensure_default_action_mailer_url_host
        base.after_action :set_delivery_options
      end

      private

      def set_delivery_options
        settings = @current_store.email_setting
        mail.perform_deliveries = (settings.mail_delivery)
        mail.from = @current_store.mail_from_address
        mail.delivery_method.settings.merge!(Hash[settings.smtp.map { |k, v| [k.to_sym, v] }]) if mail.perform_deliveries
      end

      def ensure_default_action_mailer_url_host(store_url = nil)
        ActionMailer::Base.default_url_options ||= {}
        ActionMailer::Base.default_url_options[:protocol] = 'https'
        ActionMailer::Base.default_url_options[:host] ||= store_url
      end

    end
  end
end

Spree::BaseMailer.prepend SpreeStoreMailSetting::Spree::BaseMailerDecorator