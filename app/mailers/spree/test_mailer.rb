module Spree
  class TestMailer < BaseMailer
    def test_mail(email, current_store = nil)
      @current_store = current_store
      @setting = @current_store.email_setting
      subject = @current_store.name
      mail(to: email, from: @setting.email_from, reply_to: @setting.intercept_email, subject: subject, bcc: @setting.email_bcc)
    end
  end
end
