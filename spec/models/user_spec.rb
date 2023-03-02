require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new(
      name: 'hevar',
      photo: 'https://unsplash.com/es/fotos/vuBaykPW1Dk',
      bio: 'software engineering'
    )
  end

  it 'validates presence of name' do
    user.name = nil
    expect(user).to_not be_valid
  end
end
