class InputItem < ActiveRecord::Base
  #searchkick 


  belongs_to :ware_house


  belongs_to :ctg_mtrl

  #after_commit :reindex_ctg_mtrl

  #def reindex_ctg_mtrl
  #  ctg_mtrl.reindex
  #end


  #def search_data
  #  #attributes.except(:unit_price, :count).merge(
  #  attributes.merge(
  #    :ctg_mtrl_idno => ctg_mtrl.idno,
  #    :ctg_mtrl_name => ctg_mtrl.name,
  #    :ctg_mtrl_pet_name => ctg_mtrl.pet_name,
  #    :ctg_mtrl_model_no => ctg_mtrl.model_no
  #  )
  #end

  #scope :search_import, -> { includes(:ctg_mtrl) }

end

# == Schema Information
#
# Table name: input_items
#
#  id            :integer         not null, primary key
#  unit_price    :float           default("0.0"), not null
#  count         :integer         default("0"), not null
#  total_price   :float           default("0.0"), not null
#  ware_house_id :integer
#  ctg_mtrl_id   :integer
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

