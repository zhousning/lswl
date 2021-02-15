class OutputItem < ActiveRecord::Base
  belongs_to :retrieval


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

