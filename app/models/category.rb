class Category < ApplicationRecord
  has_many :news_articles, dependent: :destroy
  validates :name, presence: true
end
