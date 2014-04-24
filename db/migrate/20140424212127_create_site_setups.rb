class CreateSiteSetups < ActiveRecord::Migration
  def change
    create_table :site_setups do |t|
      t.boolean :kickstarter
      t.boolean :site_active
      t.boolean :blog_active

      t.timestamps
    end
  end
end
