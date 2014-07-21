require 'spec_helper'

describe SessionController do
  pending "make sure all tests pass!"
  describe "GET 'new'" do
    it "returns http success" do
      get :new
      response.should be_success
    end
  end

  describe "POST 'create'" do
    before :all do
      @email = "bart.DONOTSPAM.lecki@gmail.com"
      @password = "se23rs6jnk"
      @user = FactoryGirl.build(:user, email: @email, password: @password)
      @user.save
    end

    context "with valid params" do
      it "creates session" do
        post :create, post: {:email => @email, :password => @password}
        expect(session[:user_id]).to eq(@user.id)
      end

      it "response status eq 200" do
        post :create, post: {:email => @email, :password => @password}
        expect(response.status).to eq(200)
      end

      it "renders user profile" do
        post :create, post: {:email => @email, :password => @password}
        expect(response).to render_template(user_path(@user))
      end

      it "flash message" do
        post :create, post: {:email => @email, :password => @password}
        expect(flash[:notice]).to eq "Logged successfully"
      end
    end

    context "with invalid params" do
      it "doesn't create session" do
        post :create, post: {"email" => "dasdas@dasdas.pl", "password" => "123123"}
        expect(session[:user_id]).to be_nil
      end

      it "redirects back to login page" do
        post :create, post: {"email" => "dasdas@dasdas.pl", "password" => "123123"}
        expect(response).to render_template :new
      end

      it "flash alert message" do
        post :create, post: {"email" => "dasdas@dasdas.pl", "password" => "123123"}
        expect(flash.now[:alert]).to eq "Wrong email or password. Try again!"
      end
    end
  end

  describe "DELETE 'destroy'" do
    before :all do
      @email = "bart.DONOTSPAM.lecki@gmail.com"
      @password = "se23rs6jnk"
      @user = FactoryGirl.build(:user, email: @email, password: @password)
      @user.save
    end

    it "destroys user id from cookie monster" do
      post :create, post: {:email => @email, :password => @password}
      expect(session[:user_id]).not_to be_nil
      delete :destroy
      expect(session[:user_id]).to be_nil

    end
  end

end
