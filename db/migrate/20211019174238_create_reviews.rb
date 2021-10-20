class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :written_review
      t.integer :rating
      t.references :manga, index: true, foreign_key: true

      t.timestamps
    end
  end
end
