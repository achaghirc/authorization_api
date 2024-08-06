class Application < ApplicationRecord
    has_many :actions, :dependent => :destroy
end
