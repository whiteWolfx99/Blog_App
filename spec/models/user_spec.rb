require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'John Doe') }
  let(:post) { Post.create(title: 'Test Post', author_id: user.id) }
  let(:comment) { Comment.create(content: 'Test Comment', author_id: user.id, post_id: post.id) }
  let(:like) { Like.create(author_id: user.id, post_id: post.id) }

  describe 'associations' do
    it { should have_many(:comments).class_name('Comments').with_foreign_key('author_id') }
    it { should have_many(:posts).class_name('Posts').with_foreign_key('author_id') }
    it { should have_many(:likes).class_name('Likes').with_foreign_key('author_id') }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:postcounter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe '#recent_posts' do
    it 'returns the 3 most recent posts by the user' do
      4.times do |n|
        Post.create(title: "Post #{n}", author_id: user.id)
      end
      expect(user.recent_posts.length).to eq(3)
      expect(user.recent_posts.first.title).to eq('Post 3')
    end
  end
end
