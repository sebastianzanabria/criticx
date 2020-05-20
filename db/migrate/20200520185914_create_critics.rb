class CreateCritics < ActiveRecord::Migration[6.0]
  def change
    create_table :critics do |t|
      t.string :username
      t.string :body
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
