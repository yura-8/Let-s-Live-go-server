class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.string :title, null: false   #曲名
      t.text :lyrics, null: false    #歌詞
      t.string :songer, null: false  #歌手
      t.timestamps
    end
  end
end
