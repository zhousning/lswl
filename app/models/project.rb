class Project < ActiveRecord::Base
  belongs_to :user

  has_many :picks, :dependent => :destroy
  accepts_nested_attributes_for :picks, reject_if: :all_blank, allow_destroy: true


end
