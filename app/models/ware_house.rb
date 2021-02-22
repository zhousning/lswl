class WareHouse < ActiveRecord::Base

  belongs_to :user


  has_many :input_items, :dependent => :destroy
  accepts_nested_attributes_for :input_items, reject_if: :all_blank, allow_destroy: true

  STATE = %w(opening uploading uploaded completed canceled)
  validates_inclusion_of :state, :in => STATE

  STATE.each do |state|
    define_method "#{state}?" do
      self.state == state
    end
  end

  def uploading 
    if opening? or uploaded?
      update_attribute :state, Setting.ware_houses.uploading 
    end
  end

  def uploaded 
    if uploading?
      update_attribute :state, Setting.ware_houses.uploaded
    end
  end

  def complete
    if uploaded?
      update_attribute :state, Setting.ware_houses.completed
    end
  end

  def cancel
    if opening? or uploading? or uploaded?
      update_attribute :state, Setting.ware_houses.canceled
    end
  end
end


# == Schema Information
#
# Table name: ware_houses
#
#  id         :integer         not null, primary key
#  name       :string          default(""), not null
#  sign       :string          default(""), not null
#  ware_date  :date
#  desc       :text
#  state      :string
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

