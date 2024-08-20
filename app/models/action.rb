class Action < ApplicationRecord
    belongs_to :application
    has_many :action_permission, :dependent => :destroy
    has_many :permissions, through: :action_permission
end
