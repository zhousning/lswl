class Stock < ActiveRecord::Base
  validates_numericality_of :count, :only_integer => true

  belongs_to :ctg_mtrl

  belongs_to :user

  has_many :output_items

  has_many :pick_items

  def add_count(num, unit_price)
    count = self.count + num

    total_input = self.total_input + 1
    total_unit_price = self.total_unit_price + unit_price
    avg_price = total_unit_price/total_input
    total_price = unit_price*count

    update_attributes!(:count => count, :unit_price => avg_price, :total_price => total_price, :total_input => total_input, :total_unit_price => total_unit_price)   
  end

  def minus_count(num)
    count = self.count - num
    total_price = self.unit_price*count
    update_attributes!(:count => count, :total_price => total_price) 
  end

end


# == Schema Information
#
# Table name: stocks
#
#  id               :integer         not null, primary key
#  unit_price       :float           default("0.0"), not null
#  count            :integer         default("0"), not null
#  total_price      :float           default("0.0"), not null
#  total_input      :integer         default("0"), not null
#  total_unit_price :float           default("0.0"), not null
#  position         :string          default(""), not null
#  ctg_mtrl_id      :integer
#  user_id          :integer
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

