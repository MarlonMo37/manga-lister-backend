class Review < ApplicationRecord
    belongs_to :manga
    validates :written_review, presence: true
end
