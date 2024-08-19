# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create Applications
app = Application.find_or_create_by!(name: 'Application 1')
app1 = Application.find_or_create_by!(name: 'Finance Application')
app2 = Application.find_or_create_by!(name: 'User Management')
app3 = Application.find_or_create_by!(name: 'Sales Application')

# Create Actions
manage_app_action = app.actions.find_or_create_by!(name: 'Manage App Actions', code: 'MANAGE_APP_ACTIONS')

doc_create_action = app1.actions.find_or_create_by!(name: 'Document Create', code: 'DOCUMENT_CREATE')
doc_approve_action = app1.actions.find_or_create_by!(name: 'Document Approve', code: 'DOCUMENT_APPROVE')
doc_sign_action = app1.actions.find_or_create_by!(name: 'Document Sign', code: 'DOCUMENT_SIGN')

hr_info_action = app2.actions.find_or_create_by!(name: 'Human Resources User Info', code: 'HR_USER_INFO')

s_o_create_action = app3.actions.find_or_create_by!(name: 'Sales Order Create', code: 'SALES_ORDER_CREATE')
s_o_approve_action = app3.actions.find_or_create_by!(name: 'Sales Order Approve', code: 'SALES_ORDER_APPROVE')
s_o_reject_action = app3.actions.find_or_create_by!(name: 'Sales Order Reject', code: 'SALES_ORDER_REJECT')

# Create Permissions
permission_it_admin = Permission.find_or_create_by!(name: 'IT Admin', code: 'IT_ADMIN')

doc_create_permission = Permission.find_or_create_by!(name: 'Create Documents', code: 'DOCUMENT_CREATE')
doc_approve_permission = Permission.find_or_create_by!(name: 'Approve Documents', code: 'DOCUMENT_APPROVE')
doc_sign_permission = Permission.find_or_create_by!(name: 'Sign Documents', code: 'DOCUMENT_SIGN')

hr_info_permission = Permission.find_or_create_by!(name: 'HR User Info', code: 'HR_USER_INFO')

s_o_create_permission = Permission.find_or_create_by!(name: 'Sales Order Create', code: 'SALES_ORDER_CREATE')
s_o_approve_permission = Permission.find_or_create_by!(name: 'Sales Order Approve', code: 'SALES_ORDER_APPROVE')
s_o_reject_permission = Permission.find_or_create_by!(name: 'Sales Order Reject', code: 'SALES_ORDER_REJECT')

# Create Action Permissions

ActionPermission.find_or_create_by!(action: manage_app_action, permission: permission_it_admin)

ActionPermission.find_or_create_by!(action: doc_create_action, permission: doc_create_permission)
ActionPermission.find_or_create_by!(action: doc_approve_action, permission: doc_approve_permission)
ActionPermission.find_or_create_by!(action: doc_sign_action, permission: doc_sign_permission)

ActionPermission.find_or_create_by!(action: hr_info_action, permission: hr_info_permission)

ActionPermission.find_or_create_by!(action: s_o_create_action, permission: s_o_create_permission)
ActionPermission.find_or_create_by!(action: s_o_approve_action, permission: s_o_approve_permission)
ActionPermission.find_or_create_by!(action: s_o_reject_action, permission: s_o_reject_permission)
