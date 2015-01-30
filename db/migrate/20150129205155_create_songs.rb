class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :country
      t.string :singer
      t.string :song
      t.string :url

      t.timestamps
    end
  end
end
