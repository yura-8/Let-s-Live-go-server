class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.references :song #曲id
      t.string :username #投稿者名
      t.text :post, :null => false #投稿内容
      t.timestamps
    end
  end
end
