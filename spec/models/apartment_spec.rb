require 'spec_helper'

describe Apartment do
  describe "validations" do
    it "should have name" do
      expect(Apartment.new).not_to be_valid
    end
  end

  describe "associations" do
    before :all do
      3.times do
        u = FactoryGirl.build(:user)
        u.save
      end
    end

    it "should have users" do
      a = Apartment.create(name: Faker::Name.last_name)
      first_user = User.first
      second_user = User.last
      a.users << first_user
      a.users << second_user
      expect(a.users.all).to eq([first_user, second_user])
    end
    
  end
end
