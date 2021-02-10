class CtgFrst < ActiveRecord::Base






  has_many :ctg_secds, :dependent => :destroy
  accepts_nested_attributes_for :ctg_secds, reject_if: :all_blank, allow_destroy: true


  belongs_to :user


end
