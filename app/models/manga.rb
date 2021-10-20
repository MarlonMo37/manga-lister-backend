class Manga < ApplicationRecord
    has_many :reviews
    has_many :manga_lists
    has_many :manga_genres
    has_many :lists, through: :manga_lists
    has_many :genres, through: :manga_genres
    validates :name, presence: true
    validates :image_url, presence: true
    validates :synopsis, presence: true
    validates :score, presence: true
    validates :date_start, presence: true
    validates :date_end, presence: true

    def self.get_manga_ids
        ids_url = "https://api.jikan.moe/v3/top/manga"
        url = URI(ids_url)

        response = Net::HTTP.get(url)
        information = JSON.parse(response)

        information["top"].map {|manga| manga["mal_id"]}
    end
end
