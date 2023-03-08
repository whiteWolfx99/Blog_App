require 'rails_helper'

RSpec.describe 'Users index', type: :feature do
  before do
    @john = User.create(name: 'John Doe', photo: 'https://example.com/john.jpg', bio: 'Software engineer',
                        postsCounter: 1)
    @jane = User.create(name: 'Jane Doe', photo: 'https://example.com/jane.jpg', bio: 'Designer', postsCounter: 2)
    visit users_path
  end

  it 'displays the users' do
    expect(page).to have_selector('.row', count: 2)
  end

  it 'displays the name of each user' do
    expect(page).to have_content(@john.name)
    expect(page).to have_content(@jane.name)
  end

  it 'displays the profile photo of each user' do
    expect(page).to have_selector("img[src='https://example.com/john.jpg'][alt='User\\'s profile photo']")
    expect(page).to have_selector("img[src='https://example.com/jane.jpg'][alt='User\\'s profile photo']")
  end

  it 'displays the number of posts for each user' do
    expect(page).to have_content("Number Of Posts: #{@john.postsCounter}")
    expect(page).to have_content("Number Of Posts: #{@jane.postsCounter}")
  end

  it 'links to the user show page' do
    click_link @john.name
    expect(current_path).to eq(user_path(@john))
    expect(page).to have_content(@john.name)
    expect(page).to have_selector("img[src='https://example.com/john.jpg'][alt='User\\'s profile photo']")
    expect(page).to have_content(@john.bio)
  end
end
