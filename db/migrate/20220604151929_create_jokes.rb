class CreateJokes < ActiveRecord::Migration[7.0]
  def change
    create_table :jokes do |t|
      t.string :api_id
      t.text :content

      t.timestamps
    end
  end
end
