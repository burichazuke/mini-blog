class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :text
      t.string :image

      t.timestamps
    end
  end
end
