class AddPageIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :page_id, :integer
  end
end
