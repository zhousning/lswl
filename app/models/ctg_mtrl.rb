class CtgMtrl < ActiveRecord::Base
  #searchkick

  has_many :stocks, :dependent => :destroy
  accepts_nested_attributes_for :stocks, reject_if: :all_blank, allow_destroy: true

  has_many :input_items, :dependent => :destroy
  accepts_nested_attributes_for :input_items, reject_if: :all_blank, allow_destroy: true

  has_many :enclosures, :dependent => :destroy
  accepts_nested_attributes_for :enclosures, reject_if: :all_blank, allow_destroy: true

  belongs_to :ctg_secd

  #after_commit :reindex_input_items

  #def reindex_input_items
  #  input_items.each do |input_item|
  #    input_item.reindex
  #  end
  #end

end

# == Schema Information
#
# Table name: ctg_mtrls
#
#  id          :integer         not null, primary key
#  idno        :string          default(""), not null
#  name        :string          default(""), not null
#  pet_name    :string          default(""), not null
#  model_no    :string          default(""), not null
#  ctg_secd_id :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

