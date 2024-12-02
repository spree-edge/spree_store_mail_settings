module Spree
  module Admin
    class EmailSettingsController < ResourceController

      def update
        current_store.email_setting.update(email_setting_params)
        redirect_to edit_admin_email_settings_path
      end

      def edit
        unless @email_setting = current_store.email_setting
          @email_setting = Spree::EmailSetting.create!(store_id: current_store.id)
        end
      end

      def send_test_mail
        begin
          TestMailer.test_mail(try_spree_current_user.email, current_store).deliver_now
          flash[:success] = Spree.t('mail_test.success')
        rescue => e
          flash[:error] = Spree.t('mail_test.error', e: e)
        ensure
          redirect_to edit_admin_email_settings_path
        end
      end

      private
      def email_setting_params
        params.require(:email_setting).permit(:email_from, :email_bcc, :intercept_email, :mail_delivery, :store_id, smtp: [:domain, :address, :port, :secure_connection_type, :authentication, :user_name, :password])
      end
    end
  end
end
