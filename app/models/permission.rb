class Permission < ApplicationRecord
    has_many :action_permission, :dependent => :destroy
    has_many :actions, through: :action_permission
end
