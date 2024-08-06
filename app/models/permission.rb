class Permission < ApplicationRecord
    has_many :action_permission
    has_many :actions, through: :action_permission
end
