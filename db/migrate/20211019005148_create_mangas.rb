class CreateMangas < ActiveRecord::Migration[6.1]
  def change
    create_table :mangas do |t|
      t.string :name
      t.string :image_url
      t.text :synopsis
      t.float :score
      t.string :date_start
      t.string :date_end

      t.timestamps
    end
  end
end
