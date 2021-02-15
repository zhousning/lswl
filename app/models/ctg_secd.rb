class CtgSecd < ActiveRecord::Base






  belongs_to :ctg_frst


  has_many :ctg_mtrls, :dependent => :destroy
  accepts_nested_attributes_for :ctg_mtrls, reject_if: :all_blank, allow_destroy: true


end

# == Schema Information
#
# Table name: ctg_secds
#
#  id          :integer         not null, primary key
#  name        :string          default(""), not null
#  ctg_frst_id :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

