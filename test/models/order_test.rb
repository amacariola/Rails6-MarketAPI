# test/models/order_test.rb
require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  setup do
    @order = orders(:one)
    @product1 = products(:one)
    @product2 = products(:two)
  end

  test 'Should set total of orders made' do
    @order.placements = [
      Placement.new(product_id: @product1.id, quantity: 2),
      Placement.new(product_id: @product2.id, quantity: 2)
    ]
    @order.set_total!
    expected_total = (@product1.price * 2) + (@product2.price * 2)

    assert_equal expected_total, @order.total
  end


  test 'builds 2 placements for the order Order' do
    @order.build_placements_with_product_ids_and_quantities [
      { product_id: @product1.id, quantity: 2 },
      { product_id: @product2.id, quantity: 3 },
    ]

    assert_difference('Placement.count', 2) do
      @order.save
    end
  end

  test "a user should not place an order that is greater than product quantity" do
    @order.placements << Placement.new(product_id: @product1.id, quantity: (1 + @product1.quantity))

    assert_not @order.valid?
  end
end
