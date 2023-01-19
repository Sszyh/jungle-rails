require 'rails_helper'

RSpec.describe User, type: :model do
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
end
