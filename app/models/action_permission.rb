class ActionPermission < ApplicationRecord
    belogns_to :actions
    belogns_to :permissions
end
