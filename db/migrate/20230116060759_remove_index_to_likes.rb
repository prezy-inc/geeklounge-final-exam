class RemoveIndexToLikes < ActiveRecord::Migration[7.0]
  def change
    remove_index :likes, name: "index_likes_on_user_id_id_and_micropost_id_id"
  end
end
