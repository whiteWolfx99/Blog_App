require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #index' do
    let(:user) { create(:user) }
    let!(:post1) { create(:post, author: user) }
    let!(:post2) { create(:post) }

    before { get :index, params: { user_id: user.id } }

    it 'assigns the posts of the user to @posts' do
      expect(assigns(:posts)).to contain_exactly(post_1)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    let(:user) { create(:user) }
    let(:post) { create(:post, author: user) }

    context 'when the post exists' do
      before { get :show, params: { user_id: user.id, id: post.id } }

      it 'assigns the post to @post' do
        expect(assigns(:post)).to eq(post)
      end

      it 'renders the show template' do
        expect(response).to render_template(:show)
      end
    end

    context 'when the post does not exist' do
      it 'raises ActiveRecord::RecordNotFound error' do
        expect do
          get :show, params: { user_id: user.id, id: 'invalid' }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'when the post belongs to a different user' do
      let(:other_user) { create(:user) }

      it 'raises ActiveRecord::RecordNotFound error' do
        expect do
          get :show, params: { user_id: other_user.id, id: post.id }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
