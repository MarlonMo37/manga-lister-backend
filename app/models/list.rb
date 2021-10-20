class List < ApplicationRecord
    has_many :manga_lists
    has_many :mangas, through: :manga_lists
    validates :name, presence: true
end
