class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.string :banner_image
      t.references :photographers, foreign_key: true

      t.timestamps
    end
  end
end
