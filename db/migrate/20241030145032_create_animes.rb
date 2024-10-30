class CreateAnimes < ActiveRecord::Migration[7.2]
  def change
    create_table :animes do |t|
      t.string :title
      t.text :synopsis
      t.decimal :score
      t.integer :year
      t.references :studio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
