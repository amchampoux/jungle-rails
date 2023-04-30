require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'create a user with a valid password and confirm_password fields' do
      @user = User.new(
        first_name: "Paul",
        last_name: "Brocoli",
        email: "p@gmail.com",
        password: "12345",
        password_confirmation: "12345"
      )
      @user.save
      expect(@user.save).to eq true
    end

    it 'display an error if email already exist' do
      @user1 = User.new(
        first_name: "Annie",
        last_name: "Brocoli",
        email: "a@gmail.com",
        password: "12345",
        password_confirmation: "12345"
      )
      @user1.save

      @user2 = User.new(
        first_name: "Paul",
        last_name: "Brocoli",
        email: "a@gmail.com",
        password: "12345",
        password_confirmation: "12345"
      )
      @user2.save
      expect(@user2.errors.full_messages).to be_present
    end

    it 'display an error if email is not valid' do
      @user = User.new(
        first_name: "Paul",
        last_name: "Brocoli",
        email: nil,
        password: "12345",
        password_confirmation: "12345"
      )
      @user.save
      expect(@user.errors.full_messages).to be_present
    end

    it 'display an error if first name is not valid' do
      @user = User.new(
        first_name: nil,
        last_name: "Brocoli",
        email: "p@gmail.com",
        password: "12345",
        password_confirmation: "12345"
      )
      @user.save
      expect(@user.errors.full_messages).to be_present
    end

    it 'display an error if last name is not valid' do
      @user = User.new(
        first_name: "Paul",
        last_name: nil,
        email: "p@gmail.com",
        password: "12345",
        password_confirmation: "12345"
      )
      @user.save
      expect(@user.errors.full_messages).to be_present
    end

    it 'display an error password is to short' do
      @user = User.new(
        first_name: "Paul",
        last_name: "Brocoli",
        email: "p@gmail.com",
        password: "123",
        password_confirmation: "123"
      )
      @user.save
      expect(@user.errors.full_messages).to be_present
    end

  end
end
