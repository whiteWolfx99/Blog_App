require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'John Doe') }
  let(:post) { Post.create(title: 'Test Post', author_id: user.id) }
  let(:comment) { Comment.create(content: 'Test Comment', author_id: user.id, post_id: post.id) }

  describe 'associations' do
    it { should belong_to(:users).class_name('Users').with_foreign_key('author_id') }
    it { should belong_to(:posts).class_name('Posts').with_foreign_key('post_id') }
  end

  describe '#update_comments_counter' do
    it 'increments the post\'s comments_counter by 1' do
      expect { comment.save }.to change { post.reload.comments_counter }.by(1)
    end
  end
end
