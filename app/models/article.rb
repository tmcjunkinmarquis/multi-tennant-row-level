class Article < ApplicationRecord
    validates :title, presence: true
    validates :tenant_id, presence: true
end
