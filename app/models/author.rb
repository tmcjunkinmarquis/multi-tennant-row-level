class Author < ApplicationRecord
    
    private
    
    def full_name
        "#{first_name} #{last_name}"
    end
end
