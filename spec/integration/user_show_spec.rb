RSpec.describe 'Users show', type: :feature do
  before do
    @john = User.create(name: 'John Doe', photo: 'https://example.com/john.jpg',
                        bio: 'Software engineer', postsCounter: 3)
    @post1 = @john.posts.create(title: 'Post 1', text: 'Post 1 text')
    @post2 = @john.posts.create(title: 'Post 2', text: 'Post 2 text')
    @post3 = @john.posts.create(title: 'Post 3', text: 'Post 3 text')
    visit user_path(@john)
  end

  it 'displays the user profile picture' do
    expect(page).to have_selector("img[src='https://example.com/john.jpg'][alt='User\\'s profile photo']")
  end

  it 'displays the user username' do
    expect(page).to have_content(@john.name)
  end

  it 'displays the correct number of posts' do
    expect(page).to have_content("Number Of Posts: #{User.first.postsCounter}")
  end

  it 'displays the user bio' do
    expect(page).to have_content(@john.bio)
  end

  it 'displays the first 3 posts of the user' do
    expect(page).to have_content(@post1.title)
    expect(page).to have_content(@post1.text)
    expect(page).to have_content(@post2.title)
    expect(page).to have_content(@post2.text)
    expect(page).to have_content(@post3.title)
    expect(page).to have_content(@post3.text)
  end

  it 'displays a button to view all of a user\'s posts' do
    expect(page).to have_link('See all posts', href: user_posts_path(@john))
  end

  it 'redirects to the user\'s posts index page' do
    click_link 'See all posts'
    expect(current_path).to eq(user_posts_path(@john))
  end
end
