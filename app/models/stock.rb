class Stock < ActiveRecord::Base
  validates_numericality_of :count, :only_integer => true, :greater_than_or_equal_to => 0 

  belongs_to :ctg_mtrl


  belongs_to :user

  has_many :output_items

  def add_count(num)
    count = self.count + num
    update_attribute :count, count 
  end

  def minus_count(num)
    count = self.count - num
    update_attributes!(:count => count) 
  end

end

# == Schema Information
#
# Table name: stocks
#
#  id          :integer         not null, primary key
#  count       :integer         default("0"), not null
#  position    :string          default(""), not null
#  ctg_mtrl_id :integer
#  user_id     :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

