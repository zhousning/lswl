class CtgSecd < ActiveRecord::Base






  belongs_to :ctg_frst


  has_many :materials, :dependent => :destroy
  accepts_nested_attributes_for :materials, reject_if: :all_blank, allow_destroy: true


end
