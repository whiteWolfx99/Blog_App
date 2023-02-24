require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'John Doe') }
  let(:post) { Post.create(title: 'Test Post', author_id: user.id) }
  let(:like) { Like.create(author_id: user.id, post_id: post.id) }

  describe 'associations' do
    it { should belong_to(:users).class_name('Users').with_foreign_key('author_id') }
    it { should belong_to(:posts).class_name('Posts').with_foreign_key('post_id') }
  end

  describe '#update_likes_counter' do
    it 'increments the post\'s likes_counter by 1' do
      expect { like.save }.to change { post.reload.likes_counter }.by(1)
    end
  end
end
