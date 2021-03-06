class MangaSerializer < ActiveModel::Serializer
    attributes :id, :name, :image_url, :synopsis, :score, :date_start, :date_end, :listed
    has_many :genres
    has_many :reviews
  end