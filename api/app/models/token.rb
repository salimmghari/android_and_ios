class Token < ApplicationRecord
    validates :value, presence: true, uniqueness: true

    def self.blacklist(token)
        create(value: token)
      end
    
    def self.blacklisted?(token)
        exists?(value: token)
    end
end
