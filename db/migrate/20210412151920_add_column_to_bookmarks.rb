class AddColumnToBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_column :bookmarks, :comment, :string
  end
end