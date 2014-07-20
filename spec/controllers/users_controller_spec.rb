require 'spec_helper'

describe UsersController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "returns User object" do

    end
  end

  describe "GET 'show'" do
  end

  describe "POST 'create'" do
    context "with valid attributes" do
      it "creates a new user" do
        expect{
          post :create, post: FactoryGirl.attributes_for(:user)
        }.to change(User, :count).by(1)
      end

      it "redirects to the new user" do
        post :create, post: FactoryGirl.attributes_for(:user)
        expect(response).to redirect_to User.last
      end
    end

    context "with invalid attributes" do
      it "doesn't create a new user" do
        expect {
          post :create, post: FactoryGirl.attributes_for(:user, email: nil)
        }.not_to change(User, :count)
        expect(response.status).to eq(200)
      end

      it "redirects back to create user page" do
        post :create, post: FactoryGirl.attributes_for(:user, email: nil)
        expect(response.status).to eq(200)
        expect(response).to render_template :new
      end
    end

  end
end
