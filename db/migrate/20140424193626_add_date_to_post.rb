class AddDateToPost < ActiveRecord::Migration
  def change
    add_column :posts, :display_date, :datetime
  end
end
