class AddCompanyRefToGames < ActiveRecord::Migration[6.0]
  def change
    add_reference :games, :company, null: false, foreign_key: true
  end
end
