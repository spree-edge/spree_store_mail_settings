class CreateEmailSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_email_settings do |t|
      t.string :email_from
      t.string :email_bcc
      t.string :intercept_email
      t.json :smtp, default: {domain: "", address: "", port: "", secure_connection_type: "", authentication: "", user_name: "", password: "" }
      t.boolean :mail_delivery
      t.belongs_to :store
      t.timestamps
    end
  end
end
