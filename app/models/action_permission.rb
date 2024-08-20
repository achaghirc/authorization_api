class ActionPermission < ApplicationRecord
    belongs_to :action
    belongs_to :permission
end
