# require 'rails_helper'

# RSpec.describe 'Posts', type: :request do
#   describe 'GET /users/:user_id/posts' do
#     it 'returns a ok response' do
#       user = User.create(name: 'hevar', photo: 'https://unsplash.com/es/fotos/vuBaykPW1Dk',
#  bio: 'software engineering')
#       get "/users/#{user.id}/posts"
#       expect(response).to have_http_status(:ok)
#     end
#     it 'includes correct text in the body' do
#       user = User.create(name: 'hevar', photo: 'https://unsplash.com/es/fotos/vuBaykPW1Dk',
# bio: 'software engineering')
#       post = Post.create(title: 'book', text: 'hi', author: user)
#       get "/users/#{user.id}/posts"
#       expect(response.body).to include(post.title)
#     end
#   end

#   describe 'GET #show' do
#     it 'returns a ok response' do
#       user = User.create(name: 'hevar', photo: 'https://unsplash.com/es/fotos/vuBaykPW1Dk', bio:
# 'software engineering')
#       post = Post.create(title: 'java', text: 'let us learn', author: user)
#       get "/users/#{user.id}/posts/#{post.id}"
#       expect(response).to have_http_status(:ok)
#     end
#     it 'includes correct text in the body' do
#       user = User.create(name: 'hevar', photo: 'https://unsplash.com/es/fotos/vuBaykPW1Dk',
# bio: 'software engineering')
#       post = Post.create(title: '. net core', text: 'let us learn', author: user)
#       get "/users/#{user.id}/posts/#{post.id}"
#       expect(response.body).to include(post.title)
#       expect(response.body).to include(post.text)
#     end
#   end
# end
