require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should exist after save' do
      @category = Category.new
      @product = Product.new({
        name:  'Scented Blade',
        quantity: 18,
        price: 24.99,
        category: @category
      })
      expect(@product.name).to be_present
      expect(@product.quantity).to be_present
      expect(@product.price).to be_present
      expect(@product.category).to be_present
    end

    it 'should be not valid if name is missing' do
      @category = Category.new
      @product = Product.new({
        
        quantity: 18,
        price: 24.99,
        category: @category
      })
      expect(@product).to_not be_valid
    end

    it 'should be not valid if quantity is missing' do
      @category = Category.new
      @product = Product.new({
        name:  'Scented Blade',
        
        price: 24.99,
        category: @category
      })
      expect(@product).to_not be_valid
    end

    it 'should be not valid if price is missing' do
      @category = Category.new
      @product = Product.new({
        name:  'Scented Blade',
        quantity: 18,
        
        category: @category
      })
      expect(@product).to_not be_valid
    end

    it 'should be not valid if category is missing' do
      @category = Category.new
      @product = Product.new({
        name:  'Scented Blade',
        quantity: 18,
        price: 24.99,
        
      })
      expect(@product).to_not be_valid
    end
  end
  
end
