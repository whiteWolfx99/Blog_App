class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, :text, presence: true

  def recentcomments
    comments.order(created_at: :desc).limit(5)
  end
end
