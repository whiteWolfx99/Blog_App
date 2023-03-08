# require 'rails_helper'

# RSpec.describe UsersController, type: :request do
#   describe 'GET #index' do
#     it 'returns http ok' do
#       get users_path
#       expect(response).to have_http_status(:ok)
#     end
#     it 'displays users' do
#       user_one = User.create(name: 'hevar', photo: 'https://unsplash.com/es/fotos/vuBaykPW1Dk',
#                              bio: 'software enginerring')
#       user_two = User.create(name: 'hazher', photo: 'https://unsplash.com/es/fotos/vuBaykPW1Dk', bio: 'computer')
#       get users_path
#       expect(response.body).to include(user_one.name)
#       expect(response.body).to include(user_two.name)
#     end
#   end

#   # describe 'GET #show' do
#   #   let(:user) { User.create(name: 'hevar', photo: 'https://unsplash.com/es/fotos/vuBaykPW1Dk', bio: 'software engineering') }
#   #   it 'returns http ok' do
#   #     get user_path(user)
#   #     expect(response).to have_http_status(:ok)
#   #   end
#   #   it 'displays user' do
#   #     get user_path(user)
#   #     expect(response.body).to include(user.name)
#   #     expect(response.body).to include(user.photo)
#   #     expect(response.body).to include(user.bio)
#   #   end
#   # end
# end
