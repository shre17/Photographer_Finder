class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :description
      t.references :photographers, foreign_key: true

      t.timestamps
    end
  end
end
