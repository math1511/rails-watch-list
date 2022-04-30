class AddListIdToBookmarks < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookmarks, :list, foreign_key: true
  end
end
