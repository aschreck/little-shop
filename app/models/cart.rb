class Cart
  include ActiveModel::Model
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def items
    @contents.map do |item_id, quantity|
      Item.find_by(id: item_id.to_i)
    end
  end

	def total
		total = @contents.map do |item_id, quantity|
			Item.find(item_id.to_i).price * quantity	
		end.sum
		sprintf('%.2f', total)
	end 

end
