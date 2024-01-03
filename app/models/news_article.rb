class NewsArticle < ApplicationRecord
  belongs_to :user
 belongs_to :category
  has_many_attached :images

  # =================================================
  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "content", "created_at", "id", "id_value", "sub_topic", "title", "updated_at", "user_id"]
  end


  # ==================================================

  def self.ransackable_associations(auth_object = nil)
    ["category", "images_attachments", "images_blobs", "user"]
  end
end
