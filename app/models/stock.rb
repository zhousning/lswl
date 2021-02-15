class Stock < ActiveRecord::Base

  belongs_to :ctg_mtrl


  belongs_to :user

  def add_count(num)
    count = self.count + num
    update_attribute :count, count 
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

