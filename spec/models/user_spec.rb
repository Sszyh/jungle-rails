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
end
