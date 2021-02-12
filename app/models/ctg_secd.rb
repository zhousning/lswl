class CtgSecd < ActiveRecord::Base






  belongs_to :ctg_frst


  has_many :ctg_mtrls, :dependent => :destroy
  accepts_nested_attributes_for :ctg_mtrls, reject_if: :all_blank, allow_destroy: true


end
