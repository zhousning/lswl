class Retrieval < ActiveRecord::Base

  mount_uploader :sign, EnclosureUploader






  has_many :output_items, :dependent => :destroy
  accepts_nested_attributes_for :output_items, reject_if: :all_blank, allow_destroy: true


  belongs_to :user


end

# == Schema Information
#
# Table name: retrievals
#
#  id         :integer         not null, primary key
#  name       :string          default(""), not null
#  outdate    :date
#  dept       :string          default(""), not null
#  receiver   :string          default(""), not null
#  sign       :string          default(""), not null
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

