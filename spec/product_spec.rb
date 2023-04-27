require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it 'save a product if all fields are valids' do
      @category = Category.new(name: "Flower")
      @product = Product.new(
        name: "Rose plant",
        price: "1500",
        quantity: 50,
        category: @category
      )
      expect(@product.save).to eq true
    end
      it 'display an error message if name is not valid' do
        @category = Category.new(name: "Flower")
        @product = Product.new(
          name: nil,
          price: "1500",
          quantity: 50,
          category: @category
        )
        @product.save
        expect(@product.errors.full_messages).to be_present
      end
      it 'display an error message if price is not valid' do
        @category = Category.new(name: "Flower")
        @product = Product.new(
          name: "Rose plant",
          price: "",
          quantity: 50,
          category: @category
        )
        @product.save
        expect(@product.errors.full_messages).to be_present
      end
      it 'display an error message if quantity is not valid' do
        @category = Category.new(name: "Flower")
        @product = Product.new(
          name: "Rose plant",
          price:"1500",
          quantity: nil,
          category: @category
        )
        @product.save
        expect(@product.errors.full_messages).to be_present
      end
      it 'display an error message if category is not valid' do
        @category = Category.new(name: "Flower")
        @product = Product.new(
          name: "Rose plant",
          price:"1500",
          quantity: 50,
          category: nil
        )
        @product.save
        expect(@product.errors.full_messages).to be_present
      end
  end
end

