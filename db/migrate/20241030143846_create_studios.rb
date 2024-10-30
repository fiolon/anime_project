class CreateStudios < ActiveRecord::Migration[7.2]
  def change
    create_table :studios do |t|
      t.string :studio_name

      t.timestamps
    end
  end
end
