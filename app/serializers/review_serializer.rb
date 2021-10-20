class ReviewSerializer < ActiveModel::Serializer
    attributes :written_review, :rating, :id, :manga_id
    belongs_to :manga, except: [:created_at, :updated_at]
  end