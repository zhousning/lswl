class OutputItem < ActiveRecord::Base
  validates_numericality_of :count, :only_integer => true, :greater_than_or_equal_to => 0 

  belongs_to :retrieval

  belongs_to :stock

  def add_count(my_count)
    count = self.count + my_count
    unit_price = self.stock.unit_price
    total_price = unit_price*count.to_f
    update_attributes!(:count => count, :unit_price => unit_price, :total_price => total_price)
  end
end



# == Schema Information
#
# Table name: output_items
#
#  id           :integer         not null, primary key
#  count        :integer         default("0"), not null
#  unit_price   :float           default("0.0"), not null
#  total_price  :float           default("0.0"), not null
#  retrieval_id :integer
#  stock_id     :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

