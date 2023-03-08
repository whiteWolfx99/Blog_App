require 'rails_helper'

RSpec.describe 'Post show', type: :feature do
  let(:user) { User.create(name: 'John Doe', photo: 'https://example.com/john.jpg', bio: 'Software engineer', postsCounter: 3) }
  let(:post) { user.posts.create(title: 'Post 1', text: 'Post 1 text', commentsCounter: 0, likesCounter: 0) }

  before do
    visit user_post_path(user, post)
  end

  it 'displays the post title and author name' do
    expect(page).to have_content("#{post.title} by #{user.name}")
  end

  it 'displays the post text' do
    expect(page).to have_content(post.text)
  end

  it 'displays a button to add a like' do
    expect(page).to have_button('Add a like')
  end

  it 'displays a link to add a comment' do
    expect(page).to have_link('Add a comment', href: new_user_post_comment_path(user, post))
  end

  it 'renders the comments partial' do
    expect(page).to have_css('.post_col', count: post.comments.count)
  end
end
