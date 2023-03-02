RSpec.describe Like, type: :model do
  let(:user) do
    User.create(
      name: 'hevar',
      photo: 'https://unsplash.com/es/fotos/vuBaykPW1Dk',
      bio: 'software engineering'
    )
  end

  let(:post) do
    Post.create(
      author: user,
      title: 'java',
      text: 'programming language'
    )
  end

  it 'validates the presence of author and post' do
    like = Like.create(author: user, post:)
    expect(like).to be_valid
  end
end
