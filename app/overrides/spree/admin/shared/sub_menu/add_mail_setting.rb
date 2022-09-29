Deface::Override.new(
    virtual_path: 'spree/admin/shared/sub_menu/_configuration',
    name: 'add_mail_setting',
    insert_bottom: '[data-hook="admin_configurations_sidebar_menu"]',
    text: "<%= configurations_sidebar_menu_item Spree.t(:mail_setting), edit_admin_email_settings_path %>"
)