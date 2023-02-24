class User < ApplicationRecord
  has_many :comments, class_name: 'Comments', foreign_key: 'author_id'
  has_many :posts, class_name: 'Posts', foreign_key: 'author_id'
  has_many :likes, class_name: 'Likes', foreign_key: 'author_id'

  validates :name, presence: true
  validates :postcounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
