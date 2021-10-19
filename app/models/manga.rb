class Manga < ApplicationRecord
    has_many :reviews
    has_many :manga_lists
    has_many :manga_genres
    has_many :lists, through: :manga_lists
    has_many :genres, thorugh: :manga_genres
    validates :name, presence: true
    validates :image_url, presence: true
    validates :synopsis, presence: true
    validates :score, presence: true
    validates :date_start, presence: true
    validates :date_end, presence: true
end
