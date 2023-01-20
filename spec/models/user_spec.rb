require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    describe 'password_confirmation' do
      it 'should match' do
        @user = User.new({
          name: 'Ss',
          email: 'ss@gmail.com',
          password: "123",
          password_confirmation:"123"
        })
        expect(@user).to be_valid
      end

      it 'should exist when creating the model' do
        @user = User.new({
          name: 'Ss',
          email: 'ss@gmail.com',
          password: "123",
          password_confirmation:"123"
        })
        expect(@user.password).to be_present
      end
    end

    describe 'Email' do
      it 'should be unique' do
        @user = User.new({
          name: 'Ss',
          email: 'ss@gmail.com',
          password: "123",
          password_confirmation:"123"
        })
        @user.save!
        @user2 = User.new({
          name: 'Qq',
          email: 'SS@gmail.com',
          password: "123",
          password_confirmation:"123"
        })
        expect {@user2.save!}.to raise_error(ActiveRecord::RecordInvalid,'Validation failed: Email has already been taken')
      end
    end

    describe 'field required' do
      it 'should require Email, name' do
        @user = User.new({
          
          email: 'aa@gmail.com',
          password: "123",
          password_confirmation:"123"
        })
        expect(@user).to_not be_valid
      end

      it 'should require Email, name' do
        @user = User.new({
          name: 'Ss',
          
          password: "123",
          password_confirmation:"123"
        })
        expect(@user).to_not be_valid
      end
    end

    describe 'password length' do
      it 'should more than 6' do
        @user = User.new({
          name: 'rr',
          email: 'rr@gmail.com',
          password: "12",
          password_confirmation:"12"
        })
        expect{@user.save!}.to raise_error(ActiveRecord::RecordInvalid,'Validation failed: Password is too short (minimum is 3 characters)')
      end
    end
  end

  describe '.authenticate_with_credentials' do
    subject(:instance) { described_class.new }
    it 'should return an instance of the user if successfully authenticated' do
      @user = User.new({
        name: 'rr',
        email: 'rr@gmail.com',
        password: "123",
        password_confirmation:"123"
      })
      @user.save!
      @user2 = instance.authenticate_with_credentials('rr@gmail.com','123')
      expect(@user2).to_not be_nil
    end

    it 'should return nil if authentication is failed' do
      @user = User.new({
        name: 'rr',
        email: 'rr@gmail.com',
        password: "123",
        password_confirmation:"123"
      })
      @user.save!
      @user2 = instance.authenticate_with_credentials('rr@gmail.com','1234')
      expect(@user2).to be_nil
    end

    it 'should accept spaces before/after email address' do
      @user = User.new({
        name: 'rr',
        email: 'rr@gmail.com',
        password: "123",
        password_confirmation:"123"
      })
      @user.save!
      @user2 = instance.authenticate_with_credentials('  rr@gmail.com ','123')
      expect(@user2).to_not be_nil
    end

    it 'should not be case sensitive' do
      @user = User.new({
        name: 'rr',
        email: 'rr@gmail.com',
        password: "123",
        password_confirmation:"123"
      })
      @user.save!
      @user2 = instance.authenticate_with_credentials('RR@gmail.Com','123')
      expect(@user2).to_not be_nil
    end
  end

  
end
