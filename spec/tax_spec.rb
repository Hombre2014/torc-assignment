# shopping_spec.rb

require_relative '../tax'

RSpec.describe Item do
  describe '#sales_tax' do
    it 'calculates sales tax correctly for a non-imported exempt item' do
      item = Item.new('book', 12.49, 2, false, true)
      expect(item.sales_tax).to eq(0.0)
    end

    it 'calculates sales tax correctly for an imported item, not exempt' do
      item = Item.new('imported perfume', 27.99, 1, true, false)
      expect(item.sales_tax).to eq(4.2)
    end
  end

  describe '#total_price' do
    it 'calculates total price including tax for a non-imported exempt item' do
      item = Item.new('chocolate bar', 0.85, 2, false, true)
      expect(item.total_price).to eq(1.70)
    end
  end
end

RSpec.describe Basket do
  describe '#add_item' do
    it 'adds an item to the basket' do
      basket = Basket.new
      item = Item.new('book', 12.49, 1, false, true)
      basket.add_item(item)
      expect(basket.items).to include(item)
    end
  end

  describe '#total_sales_tax' do
    it 'calculates total sales tax for all items in the basket' do
      basket = Basket.new
      item1 = Item.new('book', 12.49, 1, false, true)
      item2 = Item.new('imported perfume', 27.99, 1, true, false)
      basket.add_item(item1)
      basket.add_item(item2)
      expect(basket.total_sales_tax).to eq(4.2)
    end
  end

  describe '#total_cost' do
    it 'calculates total cost of all items in the basket' do
      basket = Basket.new
      item1 = Item.new('book', 12.49, 1, false, true)
      item2 = Item.new('imported perfume', 27.99, 1, true, false)
      basket.add_item(item1)
      basket.add_item(item2)
      expect(basket.total_cost).to eq(44.68)
    end
  end
end
