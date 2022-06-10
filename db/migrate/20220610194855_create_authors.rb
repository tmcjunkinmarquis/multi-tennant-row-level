class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :slug
      t.string :first_name
      t.string :last_name
      t.string :bio_info

      t.timestamps
    end
  end
end
