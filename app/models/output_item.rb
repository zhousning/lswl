class OutputItem < ActiveRecord::Base
  validates_numericality_of :count, :only_integer => true, :greater_than_or_equal_to => 0 

  belongs_to :retrieval

  belongs_to :stock
end

# == Schema Information
#
# Table name: output_items
#
#  id           :integer         not null, primary key
#  count        :integer         default("0"), not null
#  retrieval_id :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

