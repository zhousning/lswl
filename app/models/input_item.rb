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
