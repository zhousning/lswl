class CtgMtrl < ActiveRecord::Base




  has_many :enclosures, :dependent => :destroy
  accepts_nested_attributes_for :enclosures, reject_if: :all_blank, allow_destroy: true



  belongs_to :ctg_secd


end
