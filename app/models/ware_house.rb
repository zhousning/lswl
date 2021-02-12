class WareHouse < ActiveRecord::Base






  belongs_to :user


  has_many :input_items, :dependent => :destroy
  accepts_nested_attributes_for :input_items, reject_if: :all_blank, allow_destroy: true


end
