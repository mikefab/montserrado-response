class AddImageUrlToOrgs < ActiveRecord::Migration
  def change
    add_column :orgs, :image_url, :string
  end
end
