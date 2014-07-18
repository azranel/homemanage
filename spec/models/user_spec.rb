require 'spec_helper'

describe User do
  describe "validations" do
    before :each do
      @user = FactoryGirl.build(:user)
    end

    it "should have firstname" do
      @user.firstname = nil
      expect(@user).not_to be_valid
    end

    it "should have lastname" do
      @user.lastname = nil
      expect(@user).not_to be_valid
    end

    it "should have email" do
      @user.email = nil
      expect(@user).not_to be_valid
    end

    it "should have password" do
      @user.password = nil
      expect(@user).not_to be_valid
    end

    it "password should have salt" do
      @user.salt = nil
      expect(@user).not_to be_valid
    end

    it "password should be encrypted" do
      @user.save
    end

    it "email should have email format" do
      @user.email = "notaemail.pl"
      expect(@user).not_to be_valid
    end

    it "email should be unique" do
    end
  end

  describe "#encrypt_password" do
    it "should encrypt password" do
      user = FactoryGirl.build(:user, password: "sample")
      user.save
      expect(user.password).to eq(BCrypt::Engine.hash_secret("sample", user.salt))
    end
  end
end
