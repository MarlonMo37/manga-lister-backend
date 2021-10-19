class CreateMangaGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :manga_genres do |t|
      t.references :manga, index: true, foreign_key: true
      t.references :genre, index: true, foreign_key: true

      t.timestamps
    end
  end
end
