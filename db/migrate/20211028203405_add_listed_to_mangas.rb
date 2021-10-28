class AddListedToMangas < ActiveRecord::Migration[6.1]
  def change
    add_column :mangas, :listed, :boolean, :default => false
  end
end
