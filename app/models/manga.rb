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

    def self.make_mangas
        ids =  self.get_manga_ids

        ids.each do |id|
            sleep(0.5)
            manga_url = "https://api.jikan.moe/v3/manga/#{id}"
            url = URI(manga_url)
            response = Net::HTTP.get(url)
            information = JSON.parse(response)

            manga_info = {}
            manga_info["name"] = information["title_english"]
            manga_info["image_url"] = information["image_url"]
            manga_info["synopsis"] = information["synopsis"]
            manga_info["score"] = information["score"]
            dates = information["published"]["string"].split(" to ")
            manga_info["date_start"] = dates[0]
            if dates[1] == "?"
                manga_info["date_end"] = "ongoing"
            else 
                manga_info["date_end"] = dates[1]
            end

            current_manga = self.find_or_create_by(manga_info)

            genre_names = information["genres"].map{|genre| genre["name"]}

            self.make_genres(current_manga, genre_names)
        end
    end

    def self.make_genres(manga, genres)
        byebug
    end
end
