require 'rails_helper'

describe User do
  before(:each) do
    @user = User.create(name: "Andrea", password: "AC")
    @user2 = User.create(name: "Andrea", password: "ACagain")
    @user3 = User.create(name: "Lindsay", password: "")
  end

  it 'can be created' do
    expect(@user).to be_valid
  end

  it 'must have a unique name' do
    expect(@user2).to_not be_valid
  end

  it 'password cannot be blank' do
    expect(@user3).to_not be_valid
  end
end


describe User do
  before(:each) do
    @user = User.create(name: "Lindsay", password: "LC")
    @user2 = User.create(name: "Andrea", password: "AC")
    @user.follow(@user2)
    @user2.follow(@user)
    @user.unfollow(@user2)
  end

  it 'can have followers' do
    expect(@user2.following?(@user)).to be(true)
  end

  it 'can unfollow' do
    expect(@user.following?(@user2)).to be(false)
  end
end
