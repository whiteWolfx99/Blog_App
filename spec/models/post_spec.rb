require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'John Doe') }
  let(:post) { Post.create(title: 'Test Post', author_id: user.id) }
  let(:comment) { Comment.create(content: 'Test Comment', post_id: post.id) }

  describe 'associations' do
    it { should belong_to(:users).class_name('Users').with_foreign_key('author_id') }
    it { should have_many(:comments).class_name('Comments').with_foreign_key('post_id') }
    it { should have_many(:likes).class_name('Likes').with_foreign_key('post_id') }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(250) }
    it { should validate_numericality_of(:commentcounter).only_integer.is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:likescounter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe '#recent_comments' do
    it 'returns the 5 most recent comments on the post' do
      6.times do |n|
        Comment.create(content: "Comment #{n}", post_id: post.id)
      end
      expect(post.recent_comments.length).to eq(5)
      expect(post.recent_comments.first.content).to eq('Comment 5')
    end
  end

  describe '#update_posts_counter' do
    it 'increments the author\'s posts_counter by 1' do
      expect { post.save }.to change { user.reload.posts_counter }.by(1)
    end
  end
end
