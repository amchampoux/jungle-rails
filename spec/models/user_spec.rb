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

  describe '.authenticate_with_credentials' do

    it 'return a user when login with a valid email and password' do
      @user = User.new(
        first_name: "Paul",
        last_name: "Brocoli",
        email: "p@gmail.com",
        password: "12345",
        password_confirmation: "12345"
      )
      @user.save
      expect(User.authenticate_with_credentials(@user.email, @user.password)).to eq @user
    end

    it 'return nil when login with an invalid password' do
      @user = User.new(
        first_name: "Paul",
        last_name: "Brocoli",
        email: "p@gmail.com",
        password: "12345",
        password_confirmation: "12345"
      )
      @user.save
      expect(User.authenticate_with_credentials(@user.email, "patate")).to eq nil
    end

    it 'return nil when login with an invalid email' do
      @user = User.new(
        first_name: "Paul",
        last_name: "Brocoli",
        email: "p@gmail.com",
        password: "12345",
        password_confirmation: "12345"
      )
      @user.save
      expect(User.authenticate_with_credentials("patate@gmail.com", @user.password)).to eq nil
    end

    it 'return a user when login with spaces in the email' do
      @user = User.new(
        first_name: "Paul",
        last_name: "Brocoli",
        email: "p@gmail.com",
        password: "12345",
        password_confirmation: "12345"
      )
      @user.save
      expect(User.authenticate_with_credentials(" p@gmail.com ", @user.password)).to eq @user
    end

    it 'return a user when login with wrong cases in email' do
      @user = User.new(
        first_name: "Paul",
        last_name: "Brocoli",
        email: "p@gmail.com",
        password: "12345",
        password_confirmation: "12345"
      )
      @user.save
      expect(User.authenticate_with_credentials("P@gmail.COM", @user.password)).to eq @user
    end

    


  end

end


