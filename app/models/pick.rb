class Pick < ActiveRecord::Base

  mount_uploader :attch, EnclosureUploader

  belongs_to :project

  has_many :pick_items, :dependent => :destroy
  accepts_nested_attributes_for :pick_items, reject_if: :all_blank, allow_destroy: true

  STATE = %w(opening selecting selected completed canceled)
  validates_inclusion_of :state, :in => STATE

  STATE.each do |state|
    define_method "#{state}?" do
      self.state == state
    end
  end

  def selecting 
    if opening? or selected?
      update_attribute :state, Setting.picks.selecting 
    end
  end

  def selected 
    if selecting?
      update_attribute :state, Setting.picks.selected
    end
  end

  def complete
    if selected?
      update_attribute :state, Setting.picks.completed
    end
  end

  def cancel
    if opening? or selecting? or selected?
      update_attribute :state, Setting.picks.canceled
    end
  end


end
