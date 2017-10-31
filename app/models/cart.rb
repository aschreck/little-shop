class Cart
  include ActiveModel::Model
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def items
    @contents.map do |item, quantity|
      Item.find(item.to_i)
    end
  end

end
