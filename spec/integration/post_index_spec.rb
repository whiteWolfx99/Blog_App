require 'rails_helper'

RSpec.describe 'Posts index', type: :feature do
  before do
    @user = User.create(name: 'John Doe', photo: 'https://example.com/john.jpg', bio: 'Software engineer',
                        postsCounter: 1)
    @post1 = @user.posts.create(title: 'First post', text: 'Lorem ipsum', commentsCounter: 0, likesCounter: 0)
    @post2 = @user.posts.create(title: 'Second post', text: 'Dolor sit amet', commentsCounter: 1, likesCounter: 2)
    @comment = @post2.comments.create(text: 'Nice post!', author: @user)
    visit user_posts_path(@user)
  end

  it 'displays the title and text of each post' do
    expect(page).to have_content(@post1.title)
    expect(page).to have_content(@post1.text)
    expect(page).to have_content(@post2.title)
    expect(page).to have_content(@post2.text)
  end

  it 'displays the comments for each post' do
    expect(page).to have_content(@comment.text)
  end

  it 'displays the number of likes for each post' do
    expect(page).to have_content('Likes: 0', count: 1)
    expect(page).to have_content('Likes: 2', count: 1)
  end

  it 'links to the user show page' do
    click_link @user.name
    expect(current_path).to eq(user_path(@user))
    expect(page).to have_content(@user.name)
    expect(page).to have_selector("img[src='https://example.com/john.jpg'][alt='User\\'s profile photo']")
    expect(page).to have_content(@user.bio)
  end

  it 'displays the user profile picture' do
    expect(page).to have_selector("img[src='https://example.com/john.jpg'][alt='User\\'s profile photo']")
  end

  it 'displays the user username' do
    expect(page).to have_content(@user.name)
  end

  it 'displays the number of posts the user has written' do
    expect(page).to have_content('Number Of Posts: 1', count: 1)
  end

  it 'displays a post title' do
    expect(page).to have_content(@post1.title)
  end

  it 'displays some of the post body' do
    expect(page).to have_content(@post1.text[0, 10]) # Display first 10 characters of post body
  end

  it 'displays the first comments on a post' do
    expect(page).to have_content(@comment.text)
  end

  it 'displays the number of comments on a post' do
    expect(page).to have_content('Comments: 1', count: 1)
  end

  it 'displays the number of likes on a post' do
    expect(page).to have_content('Likes: 0', count: 1)
    expect(page).to have_content('Likes: 2', count: 1)
  end

  it 'links to the user show page' do
    click_link @user.name
    expect(current_path).to eq(user_path(@user))
    expect(page).to have_content(@user.name)
    expect(page).to have_selector("img[src='https://example.com/john.jpg'][alt='User\\'s profile photo']")
    expect(page).to have_content(@user.bio)
  end
end
