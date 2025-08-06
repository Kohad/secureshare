class CreateFileUploads < ActiveRecord::Migration[8.0]
  def change
    create_table :file_uploads do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :file
      t.boolean :public
      t.string :slug

      t.timestamps
    end
  end
end
