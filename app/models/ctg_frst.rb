class CtgFrst < ActiveRecord::Base






  has_many :ctg_secds, :dependent => :destroy
  accepts_nested_attributes_for :ctg_secds, reject_if: :all_blank, allow_destroy: true


  belongs_to :user


end

# == Schema Information
#
# Table name: ctg_frsts
#
#  id         :integer         not null, primary key
#  name       :string          default(""), not null
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

