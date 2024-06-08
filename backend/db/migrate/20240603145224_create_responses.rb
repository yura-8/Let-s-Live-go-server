class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.references :song #曲ID
      t.text :lyrics_response, :null => false #合いの手
      t.timestamps
    end
  end
end
