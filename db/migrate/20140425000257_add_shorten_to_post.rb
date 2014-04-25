class AddShortenToPost < ActiveRecord::Migration
  def change
    add_column :posts, :shorten_url, :string
  end
end
